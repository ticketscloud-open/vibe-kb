
[[Vibeapp]] - [[Vibeapp — Архитектура проекта]]

## Клиентские приложения

### Mobile App

- **Платформа**: iOS / Android
- **Framework**: React Native
- **Язык**: TypeScript
- **Локальное хранилище (offline-first)**: SQLite / Realm
- **Аутентификация**: JWT
- **Push-уведомления**: Firebase Cloud Messaging (FCM) / Apple Push Notification Service (APNs)
- **Аналитика**:
  - MyTracker
- **Мониторинг ошибок**: Sentry SDK

### Web App (пользовательское)

- **Тип**: SSR (web application)
- **Framework**: React/Next
- **Язык**: TypeScript
- **Аутентификация**: JWT
- **Мониторинг ошибок**: Sentry SDK
- **Аналитика**:
  - Yandex Metrika

### Admin Panel

- **Тип**: SPA (web application)
- **Framework**: React 19.1.1, React-admin 5.10.1
- **Язык**: TypeScript 5.9.3
- **Аутентификация**: JWT
- **Назначение**: support, контент-менеджмент, модерация, аналитика

## Серверная часть

### API Service (основной backend)

- **Архитектура**: монолит, логически разделённый на модули
- **Язык**: Python 3.13
- **Framework**: Muffin 1.2.0
- **Протоколы**: REST API
- **Аутентификация**: JWT (отдельный механизм для admin)

**Модули:**

- Auth / Users
- Tickets (ownership, передача, синхронизация)
- Marketplace (вторичная продажа)
- Social / Chat
- Notifications
- Integrations (Ticketcloud, T-Bank, Checkpoint)

### Sockets Service (realtime)

- **Назначение**: чат и realtime-события
- **Протокол**: WebSocket
- **Технология**: Python 3.13, python-socketio 5.16.0, websockets 16.0
- **Хранилище**: PostgreSQL, Redis

### Tasks Service (фоновые воркеры)

- **Назначение**: фоновые задачи, задачи по расписанию
- **Очередь**: RabbitMQ 4.1.4
- **Язык / runtime**: Python 3.13
- **Паттерн**: consumer workers

### Streams Service

- **Назначение**: потоковая синхронизация и обработка событий
- **Технология**: Python 3.13, aiokafka 0.13.0
- **Message broker**: Apache Kafka

## Хранилища данных

- **Основная БД**: PostgreSQL 14
- **Кэш / distributed lock**: Redis 8.2.2
- **Очереди сообщений**: RabbitMQ 4.1.4
- **Event streaming**: Apache Kafka 3.9.1
- **Объектное хранилище**: Yandex Object Storage (S3-compatible)

## Внешние интеграции

- **Ticketcloud** — билетная система (Kafka streams)
- **T-Bank** — эквайринг вторичной продажи, возвраты, фискализация, webhooks
- **Checkpoint (СКД)** — контроль доступа и погашение билетов (Kafka streams)
- **MTS ID** — OAuth-авторизация
- **MTS Exolve** — SMS-провайдер
- **Firebase** — push-инфраструктура (FCM/APNs)
- **Yandex Metrika** — продуктовая аналитика
- **MyTracker** — мобильная аналитика
- **Sentry** — мониторинг ошибок и логирование

## Инфраструктура и окружение

- **Контейнеризация**: Docker
- **Orchestration / DevOps**: Docker Swarm, Ansible
- **Балансировка и прокси**: Traefik (Load Balancer / Reverse Proxy)
- **Внешний доступ**: только через balancer, остальные контейнеры во внутреннем контуре