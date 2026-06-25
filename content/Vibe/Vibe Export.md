---
aliases:
  - Экспорт
---
[[Vibe]]

## Общая информация

### Топики Kafka

- **events** - События (мероприятия)
- **orders** - Заказы
- **tickets** - Билеты
- **transactions** - Транзакции
- **activity** - события связанные с пользователями

### Формат сообщений

Сообщения передаются в JSON формате (ниже представлены типы сообщений в typescript)

### Подключение к Kafka

[Подробнее](https://yandex.cloud/ru/docs/managed-kafka/operations/connect/clients)

#### Production

- **Bootstrap servers**: 
  - `rc1a-agdu796r4205p5ip.mdb.yandexcloud.net:9091`
  - `rc1b-2vq60gur5r18vpu5.mdb.yandexcloud.net:9091`
  - `rc1d-ft6jeu47b9bp2aff.mdb.yandexcloud.net:9091`

- **Security protocol**: `SASL_SSL`
- **SASL mechanism**: `SCRAM-SHA-512`
- **SSL CA certificate**: `https://storage.yandexcloud.net/cloud-certs/CA.pem`
- **SASL Username**: предоставляется по запросу
- **SASL Password**: предоставляется по запросу

#### Stage/Dev

- **Bootstrap servers**:
  - `rc1a-faass3ffar5s5q6o.mdb.yandexcloud.net:9091`

- **Security protocol**: `SASL_SSL`
- **SASL mechanism**: `SCRAM-SHA-512`
- **SSL CA certificate**: `https://storage.yandexcloud.net/cloud-certs/CA.pem`
- **SASL Username**: предоставляется по запросу
- **SASL Password**: предоставляется по запросу

## Мероприятия (events)

```typescript

export type Message = {
	// Внешний идентификатор мероприятия
	id: string;
	
	// Идентификатор билетной системы
	// TC - Ticketscloud
	// TICKETLAND - Ticketland
	system: "TC" | "TICKETLAND" | "MRS_RESTAURANTS" | "MRS_CINEMA";
	
	// Дата/время создания события (timestamp)
	created: number;
	
	// Дата/время последнего обновления события (timestamp)
	updated: number;
	
	// Название
	name: string;
	
	// Статус мероприятия
	state: "new" | "published" | "paused" | "canceled" | "finished";
	
	// Дата/время начала события (timestamp)
	start: number | null;
	
	// Дата/время окончания события (timestamp)
	end: number | null;
	
	// Возрастной рейтинг
	age_restriction: number | null;
	
	// Категория мероприятия
	category: string | null;
	
	// Минимальная цена билетов (в копейках/центах)
	price_min: number | null;
	
	// Валюта мероприятия (ISO-4217)
	currency: string;
	
	// Рейтинг
	rating: number;
	
	// Картинка мероприятия
	media: string | null;
	
	// Разрешены ли возвраты
	is_refundable: boolean;
	
	// Разрешена ли передача билетов
	is_transferable: boolean;
	
	// ID группы мероприятий (для групповых сеансов)
	group_id: string;
	
	// ID города (geobase)
	city_id: string | null;
	
	// Внешний идентификатор организатора
	organizer_id: string;
	
}
```

## Заказы (orders)

```typescript

export type Message = {
	// Внешний идентификатор заказа
	id: string;
	
	// Идентификатор билетной системы
	// TC - Ticketscloud
	// TICKETLAND - Ticketland
	system: "TC" | "TICKETLAND" | "MRS_RESTAURANTS" | "MRS_CINEMA";
	
	// Сумма заказа (в копейках/центах)
	amount: number;
	
	// Валюта заказа (ISO-4217)
	currency: string;
	
	// ID пользователя (номер телефона в формате E164)
	customer_id: string;
	
	// Дата/время заказа (timestamp)
	done_at: number
	
	// Номер заказа
	number: string
	
}
```

## Билеты (tickets)

```typescript

export type Message = {
	// Внешний идентификатор билета
	id: string;
	
	// Идентификатор билетной системы
	// TC - Ticketscloud
	// TICKETLAND - Ticketland
	system: "TC" | "TICKETLAND" | "MRS_RESTAURANTS" | "MRS_CINEMA";
	
	// Дата создания (timestamp)
	created: number;
	
	// Дата обновления (timestamp)
	updated: number;
	
	// Статус билета
	status: "active" | "used" | "refunded";
	
	// Цена билета (номинал, в копейках/центах)
	price_nominal: number;
	
	// Последняя цена перепродажи билета (номинал, в копейках/центах)
	price_last: number | null;

	// Валюта билета (ISO-4217)
	currency: string;
	
	// Название категории билета
	category: string | null;
	
	// Кол-во передач билета
	hops: number;
	
	// Внешний идентификатор мероприятия
	event_id: string;
	
	// Внешний идентификатор заказа
	order_id: string;
	
	// Кол-во использований билета
	uses: number;
	
	// Билет можно передать/продать
	transferable: boolean;
	
	// ID пользователя (номер телефона в формате E164)
	customer_id: string;
}
```

## Транзакции (transactions)

См. также [[Транзакция|типы транзакций]]

```typescript

export type Message = {
	// Внешний идентификатор транзакции
	id: string;
	
	// Идентификатор билетной системы
	// TC - Ticketscloud
	// TICKETLAND - Ticketland
	system: "TC" | "TICKETLAND" | "MRS_RESTAURANTS" | "MRS_CINEMA";
	
	// Тип транзакции 
	type: "allocate" | "subscription" | "sell" | "referral" | "withdrawal" | "donate" | "refill" | "burn" | "refund" | "redeem" | "transfer" | "escrow_unlock" | "escrow_canceled" | "reward";
	
	// Дата создания (timestamp)
	created: number;
	
	// Дата обновления (timestamp)
	updated: number;
	
	// Сумма транзакции (в копейках/центах)
	amount: number | null 
	
	// Валюта транзакции (ISO-4217)
	currency: string;
	
	// Владелец транзакции (номер телефона в формате E164)
	owner_id: string;
	
	// Участник транзакции (номер телефона в формате E164)
	customer_id: string
	
	// Внешний ID события
	event_id: string;
	
	// Внешний ID билета
	ticket_id: string;
}
```

## События пользователей (activity)

### Авторизация/регистрация

```typescript

export type Message = {
	// Тип сообщения
	// auth - авторизация
	// register - регистрация
	type: "register" | "auth";
	
	// Дата/время события (timestamp)
	created: number;
	
	// Информация о пользователе
	customer: {
		// ID в Vibe
		id: string;
		
		// Имя фамилия, никнейм в зависимости от заполнения
		name: string | null;
		
		// Номер телефона в формате E164
		phone: string;
		
		// Email
		email: string | null;
		
		// Дата/время создания пользователя (timestamp)
		created: number;
		
		// Дата/время обновления пользователя (timestamp)
		updated: number;
	}
}
```
