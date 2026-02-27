---
title: Statefull / Stateless компоненты
aliases:
  - Statefull / Stateless компоненты
---
[[Vibeapp]] - [[Vibeapp — Архитектура проекта|Архитектура проекта]]

## Stateless компоненты

Компоненты, не хранящие пользовательское состояние локально и допускающие горизонтальное масштабирование без привязки к конкретному экземпляру.

### Клиентские приложения

- **Mobile App (React Native)**
- **Web App (Next.js SSR)**
- **Admin Panel (SPA)**

### Серверные компоненты

- **API Service (монолит)**
    Stateless относительно сессий и бизнес-состояния.
    Пользовательское состояние хранится во внешних хранилищах (PostgreSQL, Redis).

- **Streams Service (Kafka Streams / aiokafka)**
    Stateless по отношению к бизнес-состоянию сервиса.
    Состояние потоков и проекций хранится во внешних системах (Kafka, PostgreSQL).

- **Tasks Service (workers)**
    Stateless.
    Обрабатывает сообщения из очередей, не хранит состояние локально.

- **Traefik (Load Balancer / Reverse Proxy)**
    Stateless (конфигурационное состояние задаётся извне)

## Stateful компоненты

Компоненты, которые хранят состояние и требуют контроля за репликацией, отказоустойчивостью и бэкапами.
### Хранилища данных

- **PostgreSQL 14 (managed, Yandex Cloud)**
    Основное stateful-хранилище бизнес-данных.

- **Redis 8.2.2 (container)**
    Stateful (cache, distributed locks).

- **RabbitMQ 4.1.4 (container)**
    Stateful (очереди сообщений, гарантии доставки).

- **Apache Kafka 3.9.1 (managed)**
    Stateful (event log, offsets, consumer groups).


### Клиентское локальное состояние

- **Local DB в Mobile App (SQLite / Realm)**
    Stateful (offline-first, локальное пользовательское состояние).

## Внешние stateful системы

- **Ticketcloud** — stateful (каталог, билеты, ownership).
- **Checkpoint (СКД)** — stateful (права доступа, погашение билетов).
- **T-Bank** — stateful (платежи, расчёты, фискализация).
- **Yandex Object Storage (S3)** — stateful (медиа-объекты).
- **MTS ID** — stateful (идентичности пользователей).