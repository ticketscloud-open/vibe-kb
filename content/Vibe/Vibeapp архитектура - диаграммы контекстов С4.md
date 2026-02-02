[[Vibeapp]]

## Level 1

```mermaid
flowchart LR
  %% C4 Level 1 — System Context (Vibeapp)

  classDef system fill:#e8f0fe,stroke:#1a73e8,stroke-width:1px,color:#1a73e8;
  classDef person fill:#fff7e6,stroke:#f29900,stroke-width:1px,color:#7a4b00;
  classDef external fill:#eef7ee,stroke:#1e8e3e,stroke-width:1px,color:#1e8e3e;

  %% People
  Guest[/"Гость"/]:::person
  User[/"Зарегистрированный пользователь"/]:::person
  Support[/"Support"/]:::person
  CM[/"Контент-менеджер"/]:::person
  Mod[/"Модератор"/]:::person
  Analyst[/"Аналитик"/]:::person

  %% System
  Vibe["Vibeapp<br/>(Mobile App + Web App + Backend/API + Admin Panel)<br/>B2C: билеты, передача и перепродажа, знакомства и чат, offline-first"]:::system

  %% External systems
  TC["Ticketcloud<br/>(Primary Ticketing System)"]:::external
  TBank["T-Bank<br/>(Эквайринг вторички + биллинг/сверка/возвраты/фискализация)<br/>Webhooks статусов"]:::external
  MTSID["MTS ID<br/>(OAuth)"]:::external
  Exolve["MTS Exolve<br/>(SMS)"]:::external
  Firebase["Firebase<br/>(FCM/APNs Push)"]:::external
  Metrika["Yandex Metrika<br/>(Analytics)"]:::external
  MyTracker["MyTracker<br/>(Analytics)"]:::external
  Sentry["Sentry<br/>(Errors & Logs)"]:::external
  YS3["Yandex Object Storage (S3)<br/>(Аватары и медиа)"]:::external

  %% Relationships: People -> System
  Guest -->|"Просмотр, онбординг, старт регистрации"| Vibe
  User -->|"Билеты: хранение, передача, перепродажа<br/>Знакомства и общение<br/>Offline-first"| Vibe

  Support -->|"Операционные задачи через Admin Panel"| Vibe
  CM -->|"Управление контентом через Admin Panel"| Vibe
  Mod -->|"Модерация через Admin Panel"| Vibe
  Analyst -->|"Метрики и отчеты через Admin Panel"| Vibe

  %% Relationships: System <-> External
  Vibe -->|"Получение мероприятий и билетов<br/>Первичная покупка и возврат первички"| TC
  TC -->|"Данные мероприятий и билетов<br/>Статусы первичных операций"| Vibe
  Vibe -->|"Синхронизация ownership после операций Vibeapp<br/>Передача и перепродажа"| TC

  Vibe -->|"Вторичная продажа: создание заказа и платежа<br/>Возврат вторички<br/>Сверка и фискализация"| TBank
  TBank -->|"Подтверждения и webhooks статусов<br/>Платеж, возврат, фискализация"| Vibe

  Vibe <-->|"OAuth login"| MTSID
  Vibe -->|"OTP и сервисные SMS"| Exolve
  Vibe -->|"Токены устройств и push payload"| Firebase

  Vibe -->|"События приложения"| Metrika
  Vibe -->|"События приложения"| MyTracker
  Vibe -->|"Ошибки, логи, трейсы"| Sentry
  Vibe -->|"Upload и Read аватарок и медиа"| YS3
```

**Vibeapp** — B2C система (Mobile App + Web App + Backend/API + Admin Panel), обеспечивающая:
- первичную работу с билетами (через Ticketcloud)
- передачу билетов,
- вторичную перепродажу (через T-Bank эквайринг),
- знакомства и общение (собственная реализация),
- offline-first доступ с последующей синхронизацией.

### Роли
- Гость — просмотр/онбординг/старт регистрации.
- Зарегистрированный пользователь — покупка/хранение/передача/перепродажа билетов, знакомства/чат, получение уведомлений.
- Support / Контент-менеджер / Модератор / Аналитик — работают через Admin Panel.

### Внешние системы и связи

**Ticketcloud**
- **Ticketcloud** → **Vibeapp**: мероприятия (каталог), билеты пользователя/данные билетов, статусы первичных операций.
- **Vibeapp** → **Ticketcloud**: операции первичной покупки и возврата первички (обрабатываются в Ticketcloud), а также синхронизация ownership после операций, выполненных в Vibeapp.
- **Ownership flow**: сначала меняется в Vibeapp, затем синхронизируется в Ticketcloud (включая передачу и перепродажу).

**T-Bank** (платежная система, вторичная продажа)
- **Vibeapp** → **T-Bank**: создание заказа/платежа для вторичной продажи (эквайринг), запросы на возвраты вторички, сверка, фискализация (если применимо).
- **T-Bank** → **Vibeapp**: подтверждения и webhooks статусов (платёж/возврат/фискализация).

**MTS ID** (OAuth)
- **Vibeapp** ↔ **MTS ID**: авторизация пользователей по OAuth (на основе телефона/учётных данных провайдера).

**MTS Exolve** (SMS)
- **Vibeapp** → **MTS Exolve**: отправка SMS (OTP/сервисные сообщения).

**Firebase** (FCM/APNs)
- **Vibeapp** → **Firebase**: регистрация токенов устройств и отправка push payload.

**Yandex Metrika / MyTracker**
- **Vibeapp** → **Analytics**: события приложения и продуктовые метрики.

**Sentry**
- Vibeapp → Sentry: ошибки/логи/трейсы.

**Yandex Object Storage (S3)**
- Vibeapp → Storage: хранение и выдача аватарок/медиа.

### Границы системы

**Внутри границы Vibeapp**: mobile/web клиенты, backend/API, admin panel, чат/знакомства, логика передачи/вторичной продажи и смены ownership, offline-first и синхронизация.

**Вне границы**: Ticketcloud (первичка и возвраты первички + внешний реестр/синх ownership), T-Bank (эквайринг вторички + возвраты/фискализация + webhooks), MTS ID/Exolve, Firebase, Metrika/MyTracker, Sentry, Yandex Storage.