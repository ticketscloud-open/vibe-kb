[[Vibeapp]]

## 🧩 Общее описание

Многоуровневая система, включающая мобильное приложение, веб-интерфейс, Telegram-бота, API-инфраструктуру и devops-окружение.

### Верхнеуровневое описание экосистемы Vibe

#### Клиентские (B2C) решения

- Мобильное приложение: Vibeapp (IOS, Android, Huawei)
- Веб. приложение: [web.vibeapp.ru](https://web.vibeapp.ru)
- Телеграм приложение:  VibeAppBot

#### Решения для бизнеса (B2B)

- API для интеграций (HTTP REST, Kafka Streams)
- Настройки жизненного цикла билетов (панель управления)
- Информирование участников мероприятий (панель управления)
- Интерактивные экраны с активностью участников (чат, реакции)
- Интеграция с СКД (передача, сканирование и гашение билетов)

## 📱 Мобильное приложение

 **Технологии:**
- [TypeScript](https://www.typescriptlang.org/)
- [React Native](https://reactnative.dev/)
- [SQLite](https://www.sqlite.org/index.html) — локальное хранилище данных

## 🖥️ Веб-приложение

  **Технологии:**
- [TypeScript](https://www.typescriptlang.org/)
- [Next.js](https://nextjs.org/)
- [React](https://react.dev/)

## 💬 Telegram-приложение

  **Технологии:**
- [TypeScript](https://www.typescriptlang.org/)
- [Next.js](https://nextjs.org/)
- [React](https://react.dev/)

> Используется для взаимодействия пользователей через Telegram с полной синхронизацией и авторизацией.

## 🔌 API и интеграции

  **Бэкенд:**
- [Python](https://www.python.org/)
- [Asyncio](https://docs.python.org/3/library/asyncio.html)
- [Muffin](https://github.com/klen/muffin) — ASGI-фреймворк

**Хранилища и кеш:**
- [PostgreSQL](https://www.postgresql.org/)
- [Redis](https://redis.io/)

**Взаимодействие:**
- **WebSockets**
- [Kafka](https://kafka.apache.org/)
- [RabbitMQ](https://www.rabbitmq.com/)

## ⚙️ DevOps и инфраструктура

  **Инструменты:**
- [Ansible](https://www.ansible.com/) — автоматизация конфигураций и деплоя
- [Docker](https://www.docker.com/) (Swarm) — контейнеризация и оркестрация
- [Traefik](https://traefik.io/) — динамический роутинг и балансировка нагрузки

## 📫 DNS и IP адреса

| Domain                                                                                 | IP Address         |
| -------------------------------------------------------------------------------------- | ------------------ |
| vibeapp.ru                                                                             | ```185.215.4.16``` |
| app.vibeapp.ru, img.vibeapp.ru, knock.vibeapp.ru,<br>sentry.vibeapp.ru, web.vibeapp.ru | `158.160.199.38`   |
| gate.ticketscloud.com                                                                  | `212.193.58.163`   |
| sale.ticketscloud.com                                                                  | `212.193.58.62`    |
| check.ticketscloud.com                                                                 | `212.193.58.116`   |
| show.ticketscloud.com                                                                  | `212.193.58.174`   |
