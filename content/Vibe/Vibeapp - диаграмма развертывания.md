---
title: Диаграмма развертывания
aliases:
  - Диаграмма развертывания
---
[[Vibeapp]] - [[Vibeapp — Архитектура проекта|Архитектура проекта]]

```mermaid
flowchart LR

  subgraph Internet["Internet"]
    Mobile["Mobile App
iOS Android"]
    WebApp["Web App
Next SSR"]
    AdminUI["Admin Panel
SPA"]
  end

  subgraph Swarm["Vibeapp Infrastructure
Docker Swarm Cluster"]
    Traefik["Traefik
Load Balancer Reverse Proxy
Public entrypoint"]

    subgraph PrivateNet["Internal network
Overlay private"]
      API["API Service
Monolith
Public API Admin API
Webhooks T-Bank"]
      Sockets["Sockets Service
WebSocket realtime"]
      Tasks["Tasks Service
Workers"]
      Streams["Streams Service
Event processing
aiokafka"]

      Redis["Redis 8.2.2
container"]
      RMQ["RabbitMQ 4.1.4
container"]
    end
  end

  subgraph Managed["Managed services
Yandex Cloud"]
    PG["PostgreSQL 14
managed"]
    Kafka["Apache Kafka 3.9.1
managed"]
  end

  subgraph External["External systems"]
    Ticketcloud["Ticketcloud"]
    Checkpoint["Checkpoint SKD
Kafka only"]
    TBank["T-Bank
Webhooks"]
    MTSID["MTS ID"]
    Exolve["MTS Exolve"]
    Firebase["Firebase FCM APNs"]
    Storage["Yandex Object Storage S3"]
    Sentry["Sentry"]
    Metrika["Yandex Metrika"]
    MyTracker["MyTracker"]
  end

  Mobile --> Traefik
  WebApp --> Traefik
  AdminUI --> Traefik

  Traefik --> API
  Traefik --> Sockets

  API --> Redis
  API --> RMQ
  API --> PG
  API --> Kafka

  Sockets --> Redis
  Sockets --> PG

  Tasks --> RMQ
  Tasks --> Redis
  Tasks --> PG

  Streams --> Kafka
  Streams --> PG
  Streams --> Ticketcloud

  API --> Ticketcloud

  Streams --> Checkpoint
  Checkpoint --> Kafka
  Kafka --> Streams

  API --> TBank
  TBank --> API

  API --> MTSID
  API --> Exolve
  API --> Firebase
  API --> Storage

  API --> Sentry
  Sockets --> Sentry
  Tasks --> Sentry
  Streams --> Sentry

  Mobile --> MyTracker
  WebApp --> Metrika
  Mobile --> Sentry
```

### Edge / публичный вход

- Публично опубликован только **Traefik** (HTTPS).
- Traefik маршрутизирует:
    - HTTP(S) на **API Service**
    - WebSocket на **Sockets Service** (в рамках того же домена).

- **Webhooks принимает только API Service от T-Bank**.

### Внутренний контур (Docker Swarm)

Контейнеры во внутренней сети (без публичных портов):

- **API Service (монолит)** — Public API + Admin API + webhooks T-Bank.
- **Sockets Service** — realtime (WS) за Traefik.
- **Tasks Service** — воркеры (RabbitMQ consumers).
- **Streams Service** — обработка событий / интеграционные потоки через Kafka (aiokafka).
- **Redis (container)**, **RabbitMQ (container)**.

### Managed сервисы (Yandex Cloud)

- **PostgreSQL 14 (managed)**
- **Apache Kafka 3.9.1 (managed)** — транспорт для интеграционных потоков, в том числе:
    - Vibeapp → Checkpoint (смена владельца билета)
    - Checkpoint → Vibeapp (погашение билета)
    - Vibeapp → Ticketscloud (смена владельца билета)
    - Ticketscloud → Vibeapp (билеты, мероприятия, возвраты)

### Внешние системы

- Ticketcloud, Checkpoint, T-Bank, MTS ID, MTS Exolve, Firebase, Yandex Object Storage, Sentry, Yandex Metrika, MyTracker — используются по публичным API/SDK.