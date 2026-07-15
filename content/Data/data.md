
## БД Ядро

>Это база данных в ClickHouse, доступна из закрытого Яндекс Облака Ticketscloud, интерфейс для запросов — [websql.yandex.cloud].

#### cities
Города.

|#|Поле|Тип|Описание|Пример|
|---|---|---|---|---|
|1|id|FixedString(2)|id города|18918|
|2|country|String|Код страны|CY|
|3|name.default|String|Название города (оригинальное)|Protaras|
|4|name.en|String|Название города (английское)|Protaras|
|5|name.ru|String|Название города (русское)|Протарас|
|6|population|UInt32|Население|20230|
|7|timezone|String|Часовой пояс|Asia/Famagusta|

---

#### events
Мероприятия.

| #   | Поле                                             | Тип                              | Описание                                                                           | Пример                                                      |
| --- | ------------------------------------------------ | -------------------------------- | ---------------------------------------------------------------------------------- | ----------------------------------------------------------- |
| 1   | kafka.partition                                  | Int8                             | Техническое поле                                                                   | 0                                                           |
| 2   | kafka.offset                                     | UInt64                           | Техническое поле                                                                   | 5057208                                                     |
| 3   | id                                               | FixedString(24)                  | id мероприятия                                                                     | 67f29893f333c4ff5490b8d1                                    |
| 4   | meta                                             | FixedString(24)                  | id мета-мероприятия                                                                | 6407210c70346524717d2e96                                    |
| 5   | name                                             | String                           | Название мероприятия                                                               | Невероятное мероприятие                                     |
| 6   | description                                      | String                           | Описание мероприятия                                                               | —                                                           |
| 7   | status                                           | String                           | Статус                                                                             | stand_by / finished / canceled / public                     |
| 8   | org                                              | FixedString(24)                  | id организатора                                                                    | 5ef508e63746b13821454801                                    |
| 9   | venue                                            | FixedString(24)                  | id площадки                                                                        | 5ef5118fd1e35d84b9249287                                    |
| 10  | map                                              | Nullable(FixedString(24))        | id схемы зала                                                                      | 67ece3e74c175d348d4858de                                    |
| 11  | lifetime.start                                   | DateTime                         | Время начала                                                                       | 2025-04-09 17:00:00                                         |
| 12  | lifetime.end                                     | DateTime                         | Время окончания                                                                    | 2025-04-09 18:30:00                                         |
| 13  | category                                         | FixedString(24)                  | id категории                                                                       | 592841f8515e35002dead94c                                    |
| 14  | tags                                             | Array(FixedString(24))           | id тегов                                                                           | массив                                                      |
| 15  | artists                                          | Array(FixedString(24))           | id артистов                                                                        | массив                                                      |
| 16  | age_rating                                       | String                           | Минимальный возраст                                                                | 18                                                          |
| 17  | open_date                                        | Bool                             | Открытая дата                                                                      | true / false                                                |
| 18  | org_extra                                        | Nullable(Decimal(9,2))           | Сервисный сбор организатора                                                        | 0                                                           |
| 19  | legal_ru.id                                      | Nullable(FixedString(24))        | id легала                                                                          | 67a1d614a6effe842a267cb0                                    |
| 20  | legal_ru.type                                    | Nullable(String)                 | Организационно-правовая форма                                                      | ltd / ip                                                    |
| 21  | legal_ru.name                                    | Nullable(String)                 | Название организации                                                               | ООО "Ромашка"                                               |
| 22  | legal_ru.inn                                     | Nullable(String)                 | ИНН                                                                                | 1234567890                                                  |
| 23  | legal_ru.address                                 | Nullable(String)                 | Юридический адрес                                                                  | г Санкт-Петербург, ул Ленина, д 10                          |
| 24  | legal_ru.ogrn                                    | Nullable(String)                 | ОГРН                                                                               | 1234567891234                                               |
| 25  | legal_ru.ogrnip                                  | Nullable(String)                 | ОГРНИП                                                                             | 123450000001234                                             |
| 26  | tickets_amount                                   | Int32                            | Количество билетов                                                                 | 2                                                           |
| 27  | rating_public                                    | Int32                            | Рейтинг мероприятия                                                                | 1                                                           |
| 28  | smart_tickets                                    | Nullable(String)                 | Смарт-билеты                                                                       | only / any / none                                           |
| 29  | vibe_settings.scan_mode                          | Nullable(String)                 | Режим сканирования                                                                 | none / dynamic                                              |
| 30  | vibe_settings.donate                             | Nullable(Bool)                   | Донат                                                                              | true / false                                                |
| 31  | vibe_settings.resale_ready                       | Nullable(Bool)                   | Разрешена перепродажа                                                              | true / false                                                |
| 32  | vibe_settings.resale_params.org_fee              | Nullable(Int32)                  | Комиссия организатора при перепродаже                                              | 50                                                          |
| 33  | vibe_settings.resale_params.min_resale_price_ppm | Nullable(Int32)                  | Минимальная цена перепродажи (от номинала)                                         | 100000                                                      |
| 34  | vibe_settings.resale_params.max_resale_price_ppm | Nullable(Int32)                  | Максимальная цена перепродажи (от номинала)                                        | 500000                                                      |
| 35  | vibe_settings.resale_free                        | Nullable(Bool)                   | Перепродажа бесплатных билетов                                                     | true / false                                                |
| 36  | updated_at                                       | DateTime                         | Время последнего изменения                                                         | 2025-04-23 03:22:33                                         |
| 37  | created_at                                       | DateTime                         | Время создания                                                                     | 2025-04-23 03:22:33                                         |
| 38  | tl_disabled                                      | Bool                             | Отключена ли автоматическая передача на витрину TicketLand (на уровне мероприятия) | true / false                                                |
| 39  | removed                                          | Bool                             | Удалено мероприятие или нет                                                        | true / false                                                |
| 40  | media.cover                                      | Nullable(String)                 | Ссылка на обложку (если есть)                                                      |                                                             |
| 41  | media.cover_small                                | Nullable(String)                 | Ссылка на обложку (если есть)                                                      |                                                             |
| 42  | media.cover_original                             | Nullable(String)                 | Ссылка на обложку (если есть)                                                      |                                                             |
| 43  | sponsored_by_mts                                 | Bool                             | Спонсировано МТС                                                                   | true / false                                                |
| 44  | send_to_moscow_dit                               | Bool                             | Флаг интеграции с департаментом информационных технологий Москвы                   | true / false                                                |
| 45  | with_mosbilet                                    | Bool                             | Мероприятие с мосбилетом                                                           | true / false                                                |
| 46  | cancel_type                                      | LowCardinality(Nullable(String)) | Как будет происходить возврат билетов: всем сразу или по запросу                   | cancel_type_unspecified / refund_to_all / refund_by_request |

---

#### meta_events
Мета-мероприятия (группы мероприятий).

| #   | Поле            | Тип                | Описание                    | Пример                   |
| --- | --------------- | ------------------ | --------------------------- | ------------------------ |
| 1   | kafka.partition | Int8               | Техническое поле            | 1                        |
| 2   | kafka.offset    | UInt64             | Техническое поле            | 357                      |
| 3   | id              | FixedString(24)    | id мета-мероприятия         | 5b7be0b306a3a2000be1d4e8 |
| 4   | name            | String             | Название                    | Невероятное мероприятие  |
| 5   | description     | Nullable(String)   | Описание                    | —                        |
| 6   | updated_at      | DateTime           | Время последнего изменения  | 2018-08-30 14:35:41      |
| 7   | org             | FixedString(24)    | id организатора             | 5b759fd2448ba7000b4edb26 |
| 8   | age_rating      | String             | Минимальный возраст         | 12                       |
| 9   | first_start     | Nullable(DateTime) | Дата первого мероприятия    | 2023-05-20 09:00:00      |
| 10  | last_finish     | Nullable(DateTime) | Дата последнего мероприятия | 2023-07-15 09:00:00      |
| 11  | rating_public   | Nullable(UInt8)    | Рейтинг                     | 0                        |

---

#### orders_done
Завершенные заказы (оплаченные).

| #   | Поле                                  | Тип                       | Описание                            | Пример                                                      |
| --- | ------------------------------------- | ------------------------- | ----------------------------------- | ----------------------------------------------------------- |
| 1   | kafka.partition                       | UInt8                     | Техническое поле                    | 1                                                           |
| 2   | kafka.offset                          | UInt64                    | Техническое поле                    | 7                                                           |
| 3   | id                                    | FixedString(24)           | id заказа                           | 5b2d306ddd4a5d000edc7f68                                    |
| 4   | number                                | UInt32                    | Номер заказа                        | 12345680                                                    |
| 5   | origin                                | LowCardinality(String)    | Источник заказа                     | widget / control_panel / api / salespoint / external_widget |
| 6   | meta_event                            | Nullable(FixedString(24)) | id мета-мероприятия                 | —                                                           |
| 7   | event                                 | FixedString(24)           | id мероприятия                      | 5b2d308ddd4a5d000edc7f6c                                    |
| 8   | org                                   | FixedString(24)           | id организатора                     | 5b2d06ac5c3eb3000c475e36                                    |
| 9   | vendor                                | FixedString(24)           | id продавца                         | 5b2d06ac5c3eb3000c475e36                                    |
| 10  | deal                                  | Nullable(FixedString(24)) | id сделки                           | —                                                           |
| 11  | managers.org.account                  | Nullable(String)          | Почта аккаунт-менеджера             | ***@ticketscloud.org                                        |
| 12  | managers.org.sale                     | Nullable(String)          | Почта сейл-менеджера (орг)          | ***@ticketscloud.org                                        |
| 13  | managers.vendor.account               | Nullable(String)          | Почта аккаунт-менеджера (вендор)    | ***@ticketscloud.org                                        |
| 14  | managers.vendor.sale                  | Nullable(String)          | Почта сейл-менеджера (вендор)       | ***@ticketscloud.org                                        |
| 15  | created_at                            | DateTime                  | Дата создания заказа                | 2018-06-30 16:19:26                                         |
| 16  | done_at                               | DateTime                  | Дата оплаты                         | 2018-06-30 16:23:26                                         |
| 17  | settings.invitation                   | UInt8                     | Приглашение                         | 0 / 1                                                       |
| 18  | settings.send_tickets                 | UInt8                     | Отправляем билет                    | 0 / 1                                                       |
| 19  | settings.smart_tickets                | UInt8                     | Смарт-билет                         | 0 / 1                                                       |
| 20  | settings.customer.user                | Nullable(FixedString(24)) | id зрителя                          | 58c19f29747040083fb5a78c                                    |
| 21  | settings.customer.name                | Nullable(String)          | ФИО покупателя                      | Иван Иванов                                                 |
| 22  | settings.customer.email               | Nullable(String)          | Email покупателя                    | ***@mail.ru                                                 |
| 23  | settings.customer.phone               | Nullable(String)          | Телефон покупателя                  | —                                                           |
| 24  | settings.customer.lang                | Nullable(String)          | Язык виджета                        | ru                                                          |
| 25  | settings.customer.session             | Nullable(String)          | Сессия пользователя                 | —                                                           |
| 26  | sessions.ga                           | Nullable(String)          | Сессия Google Analytics             | 1234567890                                                  |
| 27  | sessions.ym                           | Nullable(String)          | Сессия Яндекс.Метрики               | —                                                           |
| 28  | sessions.roistat                      | Nullable(String)          | Сессия Roistat                      | —                                                           |
| 29  | sessions.utm.id                       | Nullable(FixedString(24)) | id UTM-метки                        | 5b33e261e06075000cadf16b                                    |
| 30  | sessions.utm.source                   | Nullable(String)          | Источник кампании                   | google_poisk                                                |
| 31  | sessions.utm.campaign                 | Nullable(String)          | Название кампании                   | campaign                                                    |
| 32  | sessions.utm.medium                   | Nullable(String)          | Тип трафика                         | —                                                           |
| 33  | sessions.utm.content                  | Nullable(String)          | Содержание                          | link_in_bio                                                 |
| 34  | sessions.utm.term                     | Nullable(String)          | Ключевое слово                      | концерт                                                     |
| 35  | done_values.transaction               | Nullable(Int64)           | id транзакции                       | 33                                                          |
| 36  | done_values.nominal                   | Int64                     | Номинальная стоимость заказа (коп.) | 180000                                                      |
| 37  | done_values.full                      | Int64                     | Итоговая стоимость заказа (коп.)    | 198000                                                      |
| 38  | done_values.extra.deal                | Nullable(Int64)           | Сервисный сбор распространителя     | 0                                                           |
| 39  | done_values.extra.org                 | Nullable(Int64)           | Сервисный сбор организатора         | 18000                                                       |
| 40  | done_values.extra.full                | Nullable(Int64)           | Сервисный сбор итоговый             | 18000                                                       |
| 41  | done_values.acquiring.core            | Nullable(Int64)           | Эквайринг TC                        | 5940                                                        |
| 42  | done_values.acquiring.payment_core    | Nullable(Int64)           | Эквайринг платёжной системы         | 3960                                                        |
| 43  | done_values.acquiring.payment_partner | Nullable(Int64)           | Эквайринг партнёра                  | 0                                                           |
| 44  | done_values.deal_fees.org             | Nullable(Int64)           | Комиссия организатора               | 180000                                                      |
| 45  | done_values.deal_fees.agent           | Nullable(Int64)           | Комиссия распространителя           | 0                                                           |
| 46  | done_values.profit.org                | Nullable(Int64)           | Доход организатора                  | 192060                                                      |
| 47  | done_values.profit.agent              | Nullable(Int64)           | Доход распространителя              | 0                                                           |
| 48  | done_values.profit.core               | Nullable(Int64)           | Доход TC                            | 1980                                                        |
| 49  | done.tickets_quantity                 | UInt32                    | Количество билетов в заказе         | 1                                                           |
| 50  | done.discount                         | Nullable(Int64)           | Итоговая скидка                     | 0                                                           |
| 51  | done.payment_system                   | Nullable(String)          | Платёжная система                   | cloudpayments                                               |
| 52  | done.modificator_id                   | Nullable(FixedString(24)) | id модификатора                     | 5d27c87d3ad495e298c8f8f3                                    |
| 53  | done.promocode_id                     | Nullable(FixedString(24)) | id промокода                        | 5b321c82178e15000e7be056                                    |
| 54  | tl_widget                             | Bool                      | Флаг заказа с витрины ТЛ            | true / false                                                |
| 55  | settings.customer.ad_agree            | Nullable(Bool)            | Согласие на рекламные рассылки      | true / false                                                |
| 56  | settings.customer.newsletter_agree    | Nullable(Bool)            | Согласие на новостные рассылки      | true / false                                                |

---

#### partners
Партнеры (организаторы, распространители, подрядчики).

| #   | Поле                            | Тип                       | Описание                                                                        | Пример                    |
| --- | ------------------------------- | ------------------------- | ------------------------------------------------------------------------------- | ------------------------- |
| 1   | kafka.partition                 | Int8                      | Техническое поле                                                                | 1                         |
| 2   | kafka.offset                    | UInt64                    | Техническое поле                                                                | 9574                      |
| 3   | id                              | FixedString(24)           | id партнёра                                                                     | 5b8912efd14ff7000bbaa233  |
| 4   | name                            | String                    | Название                                                                        | Невероятный партнер       |
| 5   | role                            | String                    | Роль                                                                            | org / agent / contractor  |
| 6   | desc                            | String                    | Описание                                                                        | —                         |
| 7   | status                          | String                    | Статус                                                                          | approved / new / inactive |
| 8   | currency                        | FixedString(3)            | Валюта                                                                          | —                         |
| 9   | removed                         | Bool                      | Удалён                                                                          | true / false              |
| 10  | hidden                          | Bool                      | Скрыт                                                                           | true / false              |
| 11  | created_at                      | DateTime                  | Дата создания                                                                   | 2018-09-19 12:10:44       |
| 12  | approved_at                     | Nullable(DateTime)        | Дата одобрения                                                                  | 2018-09-19 12:43:40       |
| 13  | updated_at                      | DateTime                  | Дата изменения                                                                  | 2024-02-13 15:28:02       |
| 14  | owner                           | FixedString(24)           | Владелец (юзер)                                                                 | 5ba205cf3c6c3b394ad60ff6  |
| 15  | creator                         | FixedString(24)           | Создатель (юзер)                                                                | 5ba205cf3c6c3b394ad60ff6  |
| 16  | legal                           | Nullable(FixedString(24)) | id легала                                                                       | 5ba2076db20db5000bf5e62b  |
| 17  | manager                         | String                    | Менеджер                                                                        | ***@ticketscloud.com      |
| 18  | sale_manager                    | String                    | Менеджер продаж                                                                 | ***@ticketscloud.com      |
| 19  | categories                      | Array(FixedString(24))    | Список id категорий                                                             | массив                    |
| 20  | tags                            | Array(FixedString(24))    | Список id тегов                                                                 | массив                    |
| 21  | org_extra                       | Nullable(Decimal(9,2))    | Сервисный сбор организатора по умолчанию                                        | 0                         |
| 22  | balance_limit                   | Nullable(Int64)           | Отрицательный лимит баланса                                                     | 0                         |
| 23  | contact_core.email              | String                    | Основная почта партнёра                                                         | ***@yandex.ru             |
| 24  | contact_core.phones             | Array(String)             | Основной телефон                                                                | ["+71234567890"]          |
| 25  | contact.email                   | String                    | Почта партнёра                                                                  | ***@yandex.ru             |
| 26  | contact.phones                  | Array(String)             | Телефон                                                                         | ["+71234567890"]          |
| 27  | standard_term.org               | Nullable(Decimal(9,2))    | Стандартные условия: комиссия орга                                              | 0                         |
| 28  | standard_term.extra             | Nullable(Decimal(9,2))    | Стандартные условия: сервисный сбор                                             | 0                         |
| 29  | standard_term.agent             | Nullable(Decimal(9,2))    | Стандартные условия: комиссия агента                                            | 0                         |
| 30  | auto_accept_standard_term       | Nullable(Bool)            | Автоматическое принятие стандартных условий                                     | true / false              |
| 31  | agree_sharing_customers         | Nullable(Bool)            | Согласие на обмен клиентами                                                     | true / false              |
| 32  | gdpr_agree                      | Nullable(Bool)            | Согласие с GDPR                                                                 | true / false              |
| 33  | foreign_legal_enabled           | Nullable(Bool)            | Разрешены внешние юр. лица                                                      | true / false              |
| 34  | disable_tc_tracking             | Nullable(Bool)            | Выключить отслеживание TC                                                       | true / false              |
| 35  | allow_beta_features             | Nullable(Bool)            | Включены бета-функции                                                           | true / false              |
| 36  | allow_pushka                    | Nullable(Bool)            | Пушкинская карта                                                                | true / false              |
| 37  | tl_disabled                     | Bool                      | Отключена ли автоматическая передача на витрину TicketLand (на уровне партнера) | true / false              |
| 38  | current_events_sales_holding    | Decimal(9, 7)             |                                                                                 | 70                        |
| 39  | current_events_sales_hold_agent | Bool                      |                                                                                 | true / false              |
| 40  | allow_mosbilet                  | Bool                      | Разрешена интеграция с мосбилет                                                 | true / false              |
| 41  | disable_foreign_events          | Bool                      | Запрещены зарубежные мероприятия                                                | true / false              |
| 42  | category                        | Nullable(String)          | id категории партнера                                                           | 592841f8515e35002dead938  |


> ⚠️ Поля `contact_core.name`, `contact_core.position`, `contact_core.address`, `contact_core.www`, `contact.name`, `contact.position`, `contact.address`, `contact.www` — **пустые столбцы**, данных не содержат.

---

#### refund_requests
Запросы на возврат.

|#|Поле|Тип|Описание|Пример|
|---|---|---|---|---|
|1|kafka.partition|Int8|Техническое поле|1|
|2|kafka.offset|UInt64|Техническое поле|191233|
|3|id|String|id запроса на возврат|62ecced404b0d5547961e339|
|4|status|String|Статус возврата|approved / rejected|
|5|partner|String|id партнёра-инициатора|—|
|6|user|String|id пользователя|5df5478ed4548ba17a7bbadd|
|7|culprit|String|Виновник возврата|user / org|
|8|order|String|id заказа|61372df35140abf56a71701a|
|9|created_at|DateTime|Дата создания|2022-08-05 07:13:23|
|10|updated_at|DateTime|Дата изменения|2022-08-06 16:49:06|
|11|requested_at|DateTime|Дата запроса|2022-08-05 07:13:22|
|12|finished_at|DateTime|Дата завершения / отклонения|2022-08-06 16:49:06|
|13|policy|String|Политика возврата|law_ru_193|
|14|restrictions.law_ru_193|Decimal(9,2)|% возврата по ФЗ-193|100|
|15|restrictions.split_full_refund|Bool|Полный возврат|true / false|
|16|money_detail.refund_nominal|UInt64|Возвращаемый номинал|150000|
|17|money_detail.customer|UInt64|Сколько получит покупатель|150000|
|18|money_detail.org|UInt64|Сколько заплатит орг|150000|
|19|money_detail.agent|UInt64|Сколько заплатит агент|0|
|20|transaction|UInt32|id транзакции|1|
|21|reason_rejection|String|Причина отказа|empty / gift_ticket / by_customer|
|22|reason_type|String|Причина возврата|—|
|23|without_documents|Bool|Без документа|true / false|
|24|event|String|id мероприятия|60097b2080d149120f400705|
|25|org|String|id организатора|5d695a6ec39aba088c7cbeca|
|26|vendor|String|id распространителя|5d695a6ec39aba088c7cbeca|
|27|tickets_quantity|Int16|Количество билетов|2|

---

#### ticket_set_rules
Правила для сетов билетов (цены, периоды действия).

|#|Поле|Тип|Описание|Пример|
|---|---|---|---|---|
|1|id|FixedString(24)|id правила|5b3f3172dafbd40001b96437|
|2|set|FixedString(24)|id сета|5b3f3172dafbd40001b96433|
|3|type|String|Тип (всегда simple)|simple|
|4|lifetime_start|Nullable(DateTime)|Начало действия правила|2018-07-05 00:00:00|
|5|lifetime_finish|Nullable(DateTime)|Конец действия правила|2018-07-28 00:00:00|
|6|type.simple.price|Nullable(Int64)|Номинальная стоимость (коп.)|10000|

---

#### ticket_sets
Секторы / категории билетов мероприятия.

|#|Поле|Тип|Описание|Пример|
|---|---|---|---|---|
|1|id|FixedString(24)|id сета|5b3f3172dafbd40001b96433|
|2|event|FixedString(24)|id мероприятия|5b3f3172dafbd40001b9629b|
|3|name|String|Сектор|Партер|
|4|description|String|Описание|—|
|5|pos|Int32|Позиция (порядок)|2|
|6|sector|Nullable(FixedString(24))|id сектора|5b0d650a6e55b200867efd37|
|7|with_seats|Bool|Есть сидячие места|true / false|
|8|amount|Int32|Количество билетов|36|
|9|smart_tickets_transferable|Bool|Смарт-билеты|true / false|
|10|removed|Bool|Удалено|true / false|

---

#### venues
Площадки.

| #   | Поле          | Тип                | Описание      | Пример                   |
| --- | ------------- | ------------------ | ------------- | ------------------------ |
| 1   | id            | FixedString(24)    | id площадки   | 54537fbb9cb538685a5bfaa0 |
| 2   | created_at    | Nullable(DateTime) | Дата создания | 2015-04-10 21:41:35      |
| 3   | name          | String             | Название      | Невероятная площадка     |
| 4   | desc          | String             | Описание      | —                        |
| 5   | country       | FixedString(2)     | Страна        | RU                       |
| 6   | city          | Int32              | id города     | 524901                   |
| 7   | address       | String             | Адрес         | Москва, ул Ленина, д 1   |
| 8   | with_mosbilet | Bool               | С Мосбилетом  | true / false             |

---

#### tags
Подкатегории (теги) мероприятий.

| #   | Поле            | Тип                       | Описание              | Пример                   |
| --- | --------------- | ------------------------- | --------------------- | ------------------------ |
| 1   | kafka.partition | UInt8                     | Техническое поле      | 1                        |
| 2   | kafka.offset    | UInt64                    | Техническое поле      | 6400                     |
| 3   | kafka.timestamp | UInt64                    | Техническое поле      | 1773150743078            |
| 4   | id              | FixedString(24)           | id тега               | 69b02206d595bfc0cac6c04e |
| 5   | created_at      | DateTime                  | Дата создания         | 2026-03-10 13:52:06      |
| 6   | updated_at      | DateTime                  | Дата изменения        | 2026-03-10 13:52:06      |
| 7   | partner         | Nullable(FixedString(24)) | id партнёра           | 67eac8471ad49f2f7a01a6f2 |
| 8   | category        | Nullable(FixedString(24)) | id категории          | 592841f8515e35002dead90c |
| 9   | status          | String                    | Статус                | new / approved           |
| 10  | name.ru         | Nullable(String)          | Название (русское)    | Лекция                   |
| 11  | name.en         | Nullable(String)          | Название (английское) | Lecture                  |

---

#### legals
Юридические лица партнеров.

| #   | Поле            | Тип                    | Описание               | Пример                           |
| --- | --------------- | ---------------------- | ---------------------- | -------------------------------- |
| 1   | kafka.partition | UInt8                  | Техническое поле       | 0                                |
| 2   | kafka.offset    | UInt64                 | Техническое поле       | 4855                             |
| 3   | kafka.timestamp | UInt64                 | Техническое поле       | 1773153200662                    |
| 4   | id              | FixedString(24)        | id легала              | 69b02baca08c1b687e4b1397         |
| 5   | created_at      | DateTime               | Дата создания          | 2026-03-10 14:33:16              |
| 6   | updated_at      | DateTime               | Дата изменения         | 2026-03-10 14:33:16              |
| 7   | removed         | Bool                   | Удалён                 | true / false                     |
| 8   | user            | FixedString(24)        | id юзера               | 69b026a1fba809a0fec04935         |
| 9   | type            | LowCardinality(String) | Тип                    | ru_ip / ru_ltd / ru_se / uk / us |
| 10  | currency        | LowCardinality(String) | Валюта                 | rub / eur / kzt / gbp / usd      |
| 11  | detail.name     | Nullable(String)       | Название организации   | ООО "Невероятная организация"    |
| 12  | detail.address  | Nullable(String)       | Юридический адрес      | г Москва, ул Ленина, д 1         |
| 13  | detail.inn      | Nullable(String)       | ИНН                    | 0123456789                       |
| 14  | detail.ogrn     | Nullable(String)       | ОГРН                   | 1112223334445                    |
| 15  | detail.ogrnip   | Nullable(String)       | ОГРНИП                 | 111112222233333                  |
| 16  | bank.name       | Nullable(String)       | Название банка         | АО "ТБанк"                       |
| 17  | bank.rs         | Nullable(String)       | Расчётный счёт         | 11111222223333344444             |
| 18  | bank.ks         | Nullable(String)       | Корреспондентский счёт | 11111222223333344444             |
| 19  | bank.bik        | Nullable(String)       | БИК                    | 12345678                         |
| 20  | bank.city       | Nullable(String)       | Город банка            | г Москва                         |
| 21  | bank.iban       | Nullable(String)       | IBAN                   | —                                |
| 22  | bank.swift      | Nullable(String)       | SWIFT                  | —                                |
| 23  | bank.sort_code  | Nullable(String)       | Сортировочный код      | —                                |
| 24  | bank.account    | Nullable(String)       | Банковский счёт        | —                                |
| 25  | bank.routing    | Nullable(String)       | Банковский код         | —                                |

---

#### users
Пользователи (партнеры).

| #   | Поле                | Тип                       | Описание                            | Пример                   |
| --- | ------------------- | ------------------------- | ----------------------------------- | ------------------------ |
| 1   | kafka.partition     | UInt8                     | Техническое поле                    | 1                        |
| 2   | kafka.offset        | UInt64                    | Техническое поле                    | 76935                    |
| 3   | kafka.timestamp     | UInt64                    | Техническое поле                    | 1773149708482            |
| 4   | id                  | FixedString(24)           | id юзера                            | 5572407e9cb53858e9ac94b9 |
| 5   | created_at          | DateTime                  | Дата регистрации                    | 2015-06-06 00:36:14      |
| 6   | updated_at          | DateTime                  | Дата изменения                      | 2015-06-06 00:36:14      |
| 7   | first_name          | String                    | Имя                                 | Иван                     |
| 8   | last_name           | String                    | Фамилия                             | Иванов                   |
| 9   | email               | String                    | Email                               | ***@yandex.ru            |
| 10  | mobile              | String                    | Телефон                             | +71234567890             |
| 11  | language            | LowCardinality(String)    | Язык                                | ru                       |
| 12  | referal_partner     | Nullable(FixedString(24)) | Партнёр-реферал                     | —                        |
| 13  | signup_utm.campaign | Nullable(String)          | UTM кампания при регистрации        | —                        |
| 14  | signup_utm.source   | Nullable(String)          | UTM источник при регистрации        | —                        |
| 15  | signup_utm.medium   | Nullable(String)          | UTM тип трафика при регистрации     | —                        |
| 16  | ga_cid              | Nullable(String)          | Google Analytics id                 | —                        |
| 17  | newsletter_agree    | Bool                      | Согласие на информационную рассылку | true / false             |
| 18  | promo_agree         | Bool                      | Согласие на промо                   | true / false             |
| 19  | partner_promo_agree | Bool                      | Согласие на партнёрское промо       | true / false             |
| 20  | info_agree          | Bool                      | Согласие на инфо                    | true / false             |

---

#### deals
Сделки между партнерами.

|#|Поле|Тип|Описание|Пример|
|---|---|---|---|---|
|1|kafka.partition|UInt8|Техническое поле|1|
|2|kafka.offset|UInt64|Техническое поле|111544|
|3|kafka.timestamp|UInt64|Техническое поле|1773149827185|
|4|id|FixedString(24)|id сделки|5d1e52b7cb18045c9998ef9d|
|5|created_at|DateTime|Дата создания|2019-07-04 19:25:43|
|6|updated_at|DateTime|Дата изменения|2019-07-04 19:25:43|
|7|obj|FixedString(24)|id объекта (орг)|5cf4fa8bb933cc000c74c9a8|
|8|subj|FixedString(24)|id субъекта (агент)|5bf2af6c640440000c1f12ae|
|9|event|Nullable(FixedString(24))|id мероприятия|5d1e04097859528327ffeae2|
|10|meta_event|Nullable(FixedString(24))|id мета-мероприятия|612deff120e2a12c73ae2517|
|11|term.org|Decimal(9,7)|Доля орга|93|
|12|term.agent|Decimal(9,7)|Доля агента|7|
|13|term.extra|Decimal(9,7)|Комиссия|0|
|14|status|LowCardinality(String)|Статус сделки|revoked / terminated / declined / finished / accepted / reversed|
|15|reversed_for|Nullable(FixedString(24))|Отменена для|5b4cb3ed20bf87000c0aedf0|

---

#### categories
Категории мероприятий.

| #   | Поле                     | Тип                    | Описание                     | Пример                   |
| --- | ------------------------ | ---------------------- | ---------------------------- | ------------------------ |
| 1   | id                       | FixedString(24)        | id категории                 | 592841f8515e35002dead90c |
| 2   | created_at               | DateTime               | Дата создания                | 2017-05-26 14:55:52      |
| 3   | updated_at               | DateTime               | Дата изменения               | 2017-05-26 14:55:52      |
| 4   | status                   | LowCardinality(String) | Статус                       | approved                 |
| 5   | enable_law_ru_193_refund | Bool                   | Возвраты по ФЗ-193 разрешены | true / false             |
| 6   | name.ru                  | Nullable(String)       | Название (русское)           | Концерты                 |
| 7   | name.en                  | Nullable(String)       | Название (английское)        | Concerts                 |

**Список категорий:** Бизнес, Вечеринки, Выставки, Детям, Кино, Концерты, Музеи, Спорт, Театры, Фестивали, Экскурсии, Развитие, Балет, Здоровье, Квесты, Шоу.

---

#### triggers
Триггеры для уведомлений организаторов.

| #   | Поле              | Тип                       | Описание                     | Пример                   |
| --- | ----------------- | ------------------------- | ---------------------------- | ------------------------ |
| 1   | kafka.partition   | UInt8                     | Техническое поле             | 0                        |
| 2   | kafka.offset      | UInt64                    | Техническое поле             | 0                        |
| 3   | kafka.timestamp   | UInt64                    | Техническое поле             | 1779455524521            |
| 4   | id                | FixedString(24)           | id триггера                  | 69b9c903ac93ccf3525d7e86 |
| 5   | created_at        | DateTime                  | Дата создания                | 2026-03-17 21:34:59      |
| 6   | updated_at        | DateTime                  | Дата обновления              | 2026-03-17 21:34:59      |
| 7   | active            | Bool                      | Активен                      | true / false             |
| 8   | name              | String                    | Название                     | Продано 75%              |
| 9   | partner           | Nullable(FixedString(24)) | id организатора              | 647b485b35494dc443fe8892 |
| 10  | event             | Nullable(FixedString(24)) | id мероприятия               | 68c13f543f0fcc0bfb25247e |
| 11  | set               | Nullable(FixedString(24)) | id сектора (ticket_sets)     | 69b532fddf7d4db7e1088c4f |
| 12  | scope             | LowCardinality(String)    | Уровень триггера             | event / set              |
| 13  | unit              | LowCardinality(String)    | Единица измерения условия    | percent / tickets        |
| 14  | value             | UInt32                    | Числовое значение условия    | 75                       |
| 15  | with_invintations | Bool                      | Учитывать пригласительные    | true / false             |
| 16  | email             | Array(String)             | Список email для уведомлений | ["****@mail.ru"]         |

---
#### meta_partners
Витрина единого уровня организатора (связывает partner, legal, user в единый client_id).

| #   | Поле         | Тип                       | Описание                          | Пример                   |
| --- | ------------ | ------------------------- | --------------------------------- | ------------------------ |
| 1   | meta_partner | FixedString(24)           | Единый идентификатор организатора | 5b2cfc13a8e08c000caad7a1 |
| 2   | parent       | Nullable(FixedString(24)) | id главного легала (parent)       | 5b2cf93fc13f8b000cdcd489 |
| 3   | legal        | FixedString(24)           | id легала                         | 5b2cfc13a8e08c000caad7a1 |
| 4   | user         | FixedString(24)           | id юзера                          | 57ec4ad81bd5e036913dacf7 |
| 5   | partner      | FixedString(24)           | id партнёра                       | 5b2cfc395c3eb3000c475e31 |

---
#### meta_partners_dim
Витрина клиентов (организаторов).

| #   | Поле          | Тип                    | Описание                                                                   | Пример                     |
| --- | ------------- | ---------------------- | -------------------------------------------------------------------------- | -------------------------- |
| 1   | meta_partner  | FixedString(24)        | id объединенного организатора из mart_clients                              | 5b24e5c68522fa000b14b82b   |
| 2   | name          | Nullable(String)       | legals.detail.name главного legal                                          | ИП Невероятный организатор |
| 3   | inn           | Nullable(String)       | ИНН легала                                                                 | 525717616938               |
| 4   | registered_at | Nullable(DateTime)     | MIN(legals.created_at) по группе                                           | 2018-06-16 10:26:14        |
| 5   | first_sale_at | Nullable(DateTime)     | MIN(orders_done.done_at), done_values.full ≥ 100₽, settings.invitation = 0 | 2018-06-29 14:58:13        |
| 6   | last_sale_at  | Nullable(DateTime)     | MAX(orders_done.done_at), done_values.full ≥ 100₽, settings.invitation = 0 | 2019-11-23 17:02:13        |
| 7   | ttfs_days     | Nullable(Int32)        | first_sale_at − registered_at в днях                                       | 13                         |
| 8   | activation_at | Nullable(DateTime)     | первая done_at после gap ≥ 365 дней без продаж                             | 2021-07-29 21:02:56        |
| 9   | status        | LowCardinality(String) | статус организатора                                                        | new / active / churn       |

| Статус | Критерий                       |
| ------ | ------------------------------ |
| new    | first_sale_at IS NULL          |
| active | last_sale_at > now() − 30 дней |
| churn  | last_sale_at ≤ now() − 30 дней |

---
#### contracts
Договоры партнеров.

| #   | Поле            | Тип                       | Описание                  | Пример                              |
| --- | --------------- | ------------------------- | ------------------------- | ----------------------------------- |
| 1   | kafka.partition | UInt8                     | Техническое поле          | 1                                   |
| 2   | kafka.offset    | UInt64                    | Техническое поле          | 9802                                |
| 3   | kafka.timestamp | UInt64                    | Техническое поле          | 1782220400193                       |
| 4   | id              | FixedString(24)           | id договора               | 6a3a866fd2da67d68cf19461            |
| 5   | created_at      | DateTime                  | Дата создания             | 2026-06-23 13:13:19                 |
| 6   | updated_at      | DateTime                  | Дата обновления           | 2026-06-23 13:13:19                 |
| 7   | removed         | Bool                      | Удалён                    | true / false                        |
| 8   | name            | String                    | Название                  | Договор №О-12345678-9 от 23-06-2026 |
| 9   | partner         | FixedString(24)           | id партнёра               | 6a3a866e4af88eb0255dfba9            |
| 10  | file            | Nullable(FixedString(24)) | id файла                  | 6a3a8670d2da67d68cf19462            |
| 11  | issued_at       | DateTime                  | Дата выдачи               | 2026-06-23 13:13:19                 |
| 12  | number          | String                    | Номер договора            | О-12345678-9                        |
| 13  | parent_contract | Nullable(FixedString(24)) | id родительского договора | 69f89c6f12193eba8434799b            |


### Связи между таблицами

```
orders_done.event        → events.id
orders_done.org          → partners.id
orders_done.vendor       → partners.id
orders_done.deal         → deals.id
orders_done.meta_event   → meta_events.id

events.meta              → meta_events.id
events.org               → partners.id
events.venue             → venues.id
events.category          → categories.id
events.tags              → tags.id

ticket_sets.event        → events.id
ticket_set_rules.set     → ticket_sets.id

refund_requests.order    → orders_done.id
refund_requests.event    → events.id
refund_requests.org      → partners.id
refund_requests.vendor   → partners.id

deals.obj                → partners.id
deals.subj               → partners.id
deals.event              → events.id

venues.city              → cities.id
partners.legal           → legals.id

triggers.partner         → partners.id
triggers.event           → events.id
triggers.set             → ticket_sets.id

mart_clients.legal       → legals.id
mart_clients.user        → users.id
mart_clients.partner     → partners.id

dim_clients.client_id    → mart_clients.client_id

contracts.partner         → partners.id
contracts.parent_contract → contracts.id
```

----
## БД Вайб
>Это реплика продовой базы данных в PostgreSQL, доступ открыт. Обновляется раз в неделю (по вторникам) и по запросу (~за 2 часа).
>В планах на Q3: залить данные продовой БД в ClickHouse и настроить постоянную репликацию.

#### adminhistory
История действий администраторов.

| #   | Поле        | Тип          | Описание               | Пример                   |
| --- | ----------- | ------------ | ---------------------- | ------------------------ |
| 1   | id          | serial4      | id записи              | 2                        |
| 2   | created     | timestamp    | Дата создания          | 2020-10-20 10:38:44      |
| 3   | operation   | varchar(255) | Название операции      | transfer                 |
| 4   | note        | varchar(255) | Пояснение              | scan_mode,meta,organizer |
| 5   | external_id | varchar(255) | Внешний id             | 5f562356da2ec64587c0ade3 |
| 6   | admin_id    | varchar(255) | Телефон администратора | +71234567890             |
| 7   | customer_id | varchar(255) | Телефон покупателя     | +71234567890             |
| 8   | event_id    | int4         | id мероприятия         | 7480                     |
| 9   | ticket_id   | int4         | id билета              | 77131                    |

---

#### adminlog
Лог действий администраторов.

| #   | Поле        | Тип          | Описание          | Пример                                                                                                                                                                                                                               |
| --- | ----------- | ------------ | ----------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| 1   | id          | serial4      | id лога           | 1                                                                                                                                                                                                                                    |
| 2   | created     | timestamp    | Дата создания     | 2024-12-06 13:04:45                                                                                                                                                                                                                  |
| 3   | resource    | varchar(255) | Источник          | customer                                                                                                                                                                                                                             |
| 4   | source_id   | varchar(255) | id источника      | 1234567                                                                                                                                                                                                                              |
| 5   | action      | varchar(255) | Действие          | activate_customer / allocate / balance / block_customer / create / deauthorize_customer / delete / edit / get_balance / make_withdrawal / notify / redeem / refund / report / send / send_message_to_chat / sync / transfer / update |
| 6   | meta        | json         | Метаданные        | {"mint": 30000, "burn": 0, "currency": "BONUS_RUB"}                                                                                                                                                                                  |
| 7   | operator_id | varchar(255) | Телефон оператора | +71234567890                                                                                                                                                                                                                         |

---

#### balance
Балансы покупателей и организаторов.

| #   | Поле         | Тип          | Описание         | Пример                |
| --- | ------------ | ------------ | ---------------- | --------------------- |
| 1   | id           | serial4      | id баланса       | 29529                 |
| 2   | created      | timestamp    | Дата создания    | 2024-10-29 10:12:29   |
| 3   | updated      | timestamp    | Дата обновления  | 2024-10-29 10:12:29   |
| 4   | version      | int4         | Версия           | 8                     |
| 5   | amount       | int4         | Сумма на балансе | 126000                |
| 6   | currency     | varchar(12)  | Валюта           | BONUS_RUB / RUB / USD |
| 7   | customer_id  | varchar(255) | id покупателя    | +71234567890          |
| 8   | organizer_id | int4         | id организатора  | 7                     |

---

#### booking
Бронирования (рестораны).

| #   | Поле          | Тип          | Описание                       | Пример                          |
| --- | ------------- | ------------ | ------------------------------ | ------------------------------- |
| 1   | system_       | varchar(255) | Система бронирования           | TICKETLAND / MRS                |
| 2   | external_id   | varchar(255) | Внешний id бронирования        | 123456                          |
| 3   | created       | timestamp    | Дата создания                  | 2026-04-28 11:51:30             |
| 4   | type          | varchar(20)  | Тип бронирования               | restaurant                      |
| 5   | status        | varchar(20)  | Статус                         | pending / confirmed / cancelled |
| 6   | fio           | varchar(255) | ФИО пользователя               | Иван Иванов                     |
| 7   | amount        | int4         | Количество человек             | 2                               |
| 8   | start         | timestamp    | Время начала бронирования      | 2026-05-28 10:14:00             |
| 9   | comment       | text         | Комментарий                    | —                               |
| 10  | error_message | text         | Текст ошибки                   | NULL                            |
| 11  | customer_id   | varchar(255) | Телефон пользователя           | +71234567890                    |
| 12  | location_id   | varchar(255) | id локации из таблицы location | 1234                            |

---

#### campaign
Рекламные кампании (бонусы, промокоды).

| #   | Поле                 | Тип          | Описание                                 | Пример               |
| --- | -------------------- | ------------ | ---------------------------------------- | -------------------- |
| 1   | id                   | serial4      | id кампании                              | 114                  |
| 2   | created              | timestamp    | Дата создания                            | 2025-10-17 11:48:44  |
| 3   | updated              | timestamp    | Дата обновления                          | 2025-10-17 11:48:44  |
| 4   | title                | varchar(100) | Название кампании                        | Невероятная кампания |
| 5   | title_in_app         | varchar(50)  | Название в приложении                    | Невероятная кампания |
| 6   | description          | text         | Описание                                 | —                    |
| 7   | start                | timestamp    | Дата начала                              | 2025-09-02 06:31:00  |
| 8   | end                  | timestamp    | Дата завершения                          | 2025-10-01 05:30:00  |
| 9   | reward               | int4         | Сумма награды / бонуса                   | 30000                |
| 10  | currency             | varchar(12)  | Валюта награды                           | BONUS_RUB            |
| 11  | promocode            | varchar(50)  | Промокод                                 | VIBE300              |
| 12  | status               | varchar(255) | Статус                                   | ongoing / finished   |
| 13  | tickets_to_buy       | int4         | Сколько билетов нужно купить для награды | 0                    |
| 14  | event_id             | int4         | id мероприятия                           | —                    |
| 15  | is_active            | bool         | Активна                                  | TRUE / FALSE         |
| 16  | terms_and_conditions | varchar(255) | Условия кампании (ссылка)                | —                    |

---

#### card
Банковские карты покупателей.

| #   | Поле        | Тип          | Описание                 | Пример                             |
| --- | ----------- | ------------ | ------------------------ | ---------------------------------- |
| 1   | id          | serial4      | id карты                 | 12345                              |
| 2   | created     | timestamp    | Дата создания            | 2025-02-20 08:38:50                |
| 3   | updated     | timestamp    | Дата обновления          | 2025-02-20 15:30:02                |
| 4   | last4       | varchar(4)   | Последние 4 цифры        | 1234                               |
| 5   | token       | varchar(255) | Токен                    | 1234567890                         |
| 6   | is_hidden   | bool         | Скрыта                   | TRUE / FALSE                       |
| 7   | provider    | varchar(20)  | Провайдер                | tinkoff / qiwi                     |
| 8   | status      | varchar(10)  | Статус                   | new / active / invalid             |
| 9   | customer_id | varchar(255) | id покупателя            | +71234567890                       |
| 10  | type        | varchar(20)  | Платёжная система        | Discover / Mastercard / MIR / Visa |
| 11  | digest      | varchar(64)  | Хэшированный номер карты | —                                  |
| 12  | expire_date | date         | Срок действия            | 2026-03-31                         |

---

#### city
Города.

| #   | Поле         | Тип           | Описание                  | Пример              |
| --- | ------------ | ------------- | ------------------------- | ------------------- |
| 1   | id           | serial4       | id города                 | 12345               |
| 2   | created      | timestamp     | Дата создания             | 2025-04-03 12:26:12 |
| 3   | updated      | timestamp     | Дата обновления           | 2025-04-03 12:48:41 |
| 4   | external_id  | varchar(10)   | Внешний id                | 1234567             |
| 5   | name         | varchar(255)  | Название города           | Videmala            |
| 6   | name_local   | varchar(255)  | Название на местном языке | Videmala            |
| 7   | latitude     | numeric(10,7) | Широта                    | 41.61299            |
| 8   | longitude    | numeric(10,7) | Долгота                   | -6.04056            |
| 9   | country_code | varchar(2)    | Код страны                | ES                  |
| 10  | timezone     | varchar(50)   | Часовой пояс              | Europe/Madrid       |

---

#### complaint
Жалобы пользователей.

| #   | Поле               | Тип          | Описание            | Пример                                                              |
| --- | ------------------ | ------------ | ------------------- | ------------------------------------------------------------------- |
| 1   | id                 | serial4      | id жалобы           | 1                                                                   |
| 2   | created            | timestamp    | Дата создания       | 2022-08-02 14:02:58                                                 |
| 3   | complainer_id      | varchar(255) | Телефон жалующегося | +71234567890                                                        |
| 4   | blamed_customer_id | varchar(255) | Телефон обвиняемого | +71234567890                                                        |
| 5   | body               | text         | Текст жалобы        | complain about avatar / description / message / user / user profile |
| 6   | message_id         | int4         | id сообщения        | 105809                                                              |
| 7   | post_id            | int4         | id поста            | 1525                                                                |
| 8   | event_id           | int4         | id мероприятия      | 1223824                                                             |

---

#### customer
Покупатели (пользователи приложения).

| #   | Поле             | Тип          | Описание                             | Пример                               |
| --- | ---------------- | ------------ | ------------------------------------ | ------------------------------------ |
| 1   | id               | serial4      | id покупателя                        | 1537858                              |
| 2   | created          | timestamp    | Дата создания                        | 2024-09-15 16:30:27                  |
| 3   | email            | varchar(255) | Email                                | ***@inbox.ru                         |
| 4   | is_active        | bool         | Активен                              | TRUE / FALSE                         |
| 5   | phone            | varchar(255) | Телефон                              | +71234567890                         |
| 6   | updated          | timestamp    | Дата обновления                      | 2024-10-01 19:35:09                  |
| 7   | meta             | json         | Метаданные (IP, версия клиента, FCM) | —                                    |
| 8   | suspicious       | bool         | Подозрителен                         | TRUE / FALSE                         |
| 9   | last_name        | varchar(255) | Фамилия                              | —                                    |
| 10  | first_name       | varchar(255) | Имя                                  | —                                    |
| 11  | language         | varchar(2)   | Язык                                 | ru / en / az / de / es / fr / tr ... |
| 12  | role             | varchar(5)   | Роль                                 | user / owner / admin                 |
| 13  | is_super         | bool         | Суперпользователь                    | TRUE / FALSE                         |
| 14  | organizer_id     | int4         | id организатора                      | —                                    |
| 15  | nickname         | varchar(255) | Никнейм                              | —                                    |
| 16  | bio              | varchar(512) | Описание профиля                     | —                                    |
| 17  | bonus_agreement  | bool         | Согласие на бонусы                   | TRUE / FALSE                         |
| 18  | authorized       | timestamp    | Дата последней авторизации           | 2024-09-15 16:30:58                  |
| 19  | birthday         | timestamp    | День рождения                        | —                                    |
| 20  | gender           | varchar(6)   | Пол                                  | —                                    |
| 21  | city_id          | varchar(10)  | id города                            | 524901                               |
| 22  | notify_chat      | bool         | Оповещения из чата                   | TRUE / FALSE                         |
| 23  | notify_ads       | bool         | Оповещения о рекламе                 | TRUE / FALSE                         |
| 24  | notify_award     | bool         | Оповещения о наградах                | TRUE / FALSE                         |
| 25  | notify_cash      | bool         | Оповещения о балансе                 | TRUE / FALSE                         |
| 26  | first_authorized | timestamp    | Дата первой авторизации              | 2024-09-15 16:30:58                  |

---

#### customercampaign
Участие покупателей в рекламных кампаниях.

| #   | Поле               | Тип          | Описание                      | Пример                 |
| --- | ------------------ | ------------ | ----------------------------- | ---------------------- |
| 1   | id                 | serial4      | id записи                     | 1                      |
| 2   | created            | timestamp    | Дата создания                 | 2025-08-19 12:07:41    |
| 3   | updated            | timestamp    | Дата обновления               | 2025-08-19 12:07:41    |
| 4   | participate_date   | timestamp    | Дата принятия участия         | 2025-08-19 12:07:41    |
| 5   | reward_date        | timestamp    | Дата вознаграждения           | 2025-08-19 12:07:41    |
| 6   | campaign_id        | int4         | id рекламной кампании         | 36                     |
| 7   | customer_id        | varchar(255) | Телефон покупателя            | +71234567890           |
| 8   | event_id           | int4         | id мероприятия                | —                      |
| 9   | meta               | json         | Метаданные (купленные билеты) | {"bought_tickets": []} |
| 10  | should_be_rewarded | bool         | Должен быть вознаграждён      | TRUE / FALSE           |

---

#### customerevent
Мероприятия, которые покупатель отслеживает / скрыл.

| #   | Поле        | Тип          | Описание           | Пример              |
| --- | ----------- | ------------ | ------------------ | ------------------- |
| 1   | id          | serial4      | id записи          | 3321650             |
| 2   | created     | timestamp    | Дата создания      | 2025-11-26 09:14:27 |
| 3   | message_id  | int4         | id сообщения       | —                   |
| 4   | event_id    | int4         | id мероприятия     | 586426604           |
| 5   | customer_id | varchar(255) | Телефон покупателя | +71234567890        |
| 6   | notify      | bool         | Оповещать          | TRUE / FALSE        |
| 7   | hidden      | bool         | Скрыто             | TRUE / FALSE        |

---

#### customerlog
Лог действий покупателей (настройки оповещений).

| #   | Поле        | Тип          | Описание           | Пример                                                |
| --- | ----------- | ------------ | ------------------ | ----------------------------------------------------- |
| 1   | id          | serial4      | id лога            | 1                                                     |
| 2   | created     | timestamp    | Дата создания      | 2025-10-27 09:54:50                                   |
| 3   | action      | varchar(12)  | Действие           | notify_ads / notify_award / notify_cash / notify_chat |
| 4   | done        | bool         | Завершено          | TRUE / FALSE                                          |
| 5   | ip          | varchar(15)  | IP-адрес           | 12.345.678.901                                        |
| 6   | client      | varchar(128) | Клиент             | Tickets Wallet 7.0.25                                 |
| 7   | customer_id | varchar(255) | Телефон покупателя | +71234567890                                          |

---

#### customersubscription
Подписки покупателей — неактуальные данные по старой функциональности. Нигде не используются.

| #   | Поле            | Тип          | Описание            | Пример              |
| --- | --------------- | ------------ | ------------------- | ------------------- |
| 1   | id              | serial4      | id записи           | 3                   |
| 2   | created         | timestamp    | Дата создания       | 2020-02-17 21:43:09 |
| 3   | updated         | timestamp    | Дата обновления     | 2020-02-17 21:43:09 |
| 4   | version         | int4         | Версия              | 1                   |
| 5   | auto_payment    | bool         | Автоплатёж          | TRUE / FALSE        |
| 6   | paid            | timestamp    | Дата оплаты         | 2020-02-19 11:51:17 |
| 7   | is_active       | bool         | Активна             | TRUE / FALSE        |
| 8   | payment_error   | bool         | Ошибка оплаты       | TRUE / FALSE        |
| 9   | source          | varchar(255) | Источник оплаты     | cloudpayments       |
| 10  | source_id       | varchar(255) | id источника оплаты | sc_941c64b8...      |
| 11  | meta            | json         | Метаданные          | {}                  |
| 12  | subscription_id | int4         | id подписки         | 1                   |
| 13  | customer_id     | varchar(255) | Телефон покупателя  | +71234567890        |

---

#### customertransaction
Транзакции покупателей.

| #   | Поле        | Тип          | Описание                    | Пример                                                              |
| --- | ----------- | ------------ | --------------------------- | ------------------------------------------------------------------- |
| 1   | id          | serial4      | id транзакции               | 6729959                                                             |
| 2   | created     | timestamp    | Дата создания               | 2025-02-21 12:01:02                                                 |
| 3   | updated     | timestamp    | Дата обновления             | 2025-02-21 12:01:02                                                 |
| 4   | amount      | int4         | Сумма транзакции            | 0                                                                   |
| 5   | currency    | varchar(12)  | Валюта                      | BONUS_RUB / EUR / RUB / USD                                         |
| 6   | is_pending  | bool         | Ожидание                    | TRUE / FALSE                                                        |
| 7   | is_rejected | bool         | Отказ                       | TRUE / FALSE                                                        |
| 8   | type        | int4         | Тип транзакции (зашифрован) | 92 / 54 / 4 / 30 / 50 / 40 / 60 / 14 / 80 / 70 / 20 / 90 / 45 / 100 |
| 9   | meta        | json         | Метаданные                  | {}                                                                  |
| 10  | customer_id | varchar(255) | Телефон покупателя          | +71234567890                                                        |
| 11  | ticket_id   | int4         | id билета                   | 4121350                                                             |
| 12  | event_id    | int4         | id мероприятия              | 580773048                                                           |
| 13  | hidden      | bool         | Скрыта                      | TRUE / FALSE                                                        |
| 14  | system_     | varchar(255) | Система                     | PHANTOM / TC / TEST                                                 |
> **Расшифровка поля `type`:**
>
> | Код | Тип | Описание |
> |-----|-----|----------|
> | 4 | allocate | Выпуск билета (при покупке через виджет) |
> | 14 | subscription | Списание за подписку на мероприятия |
> | 20 | sell | Продажа билета на бирже (начисление средств) |
> | 30 | referral | Реферальное начисление |
> | 40 | withdrawal | Создание запроса на вывод средств |
> | 45 | donate | Донат от зрителя артисту |
> | 50 | refill | Начисление средств в различных случаях |
> | 54 | burn | Списание средств |
> | 60 | refund | Возврат билета (возможно начисление) |
> | 70 | redeem | Погашение билета |
> | 80 | transfer | Передача (дарение) билета |
> | 90 | escrow_unlock | Вывод заблокированных средств |
> | 92 | escrow_canceled | Отмена блокировки средств |
> | 100 | reward | Начисление вознаграждения (за акции и т.д.) |

---

#### customerwithdrawal
Выводы средств покупателями.

| #   | Поле        | Тип          | Описание                             | Пример                                                   |
| --- | ----------- | ------------ | ------------------------------------ | -------------------------------------------------------- |
| 1   | id          | serial4      | id вывода                            | 21                                                       |
| 2   | created     | timestamp    | Дата создания                        | 2019-12-15 21:51:59                                      |
| 3   | updated     | timestamp    | Дата обновления                      | 2019-12-15 21:52:00                                      |
| 4   | version     | int4         | Версия                               | 4                                                        |
| 5   | status      | varchar(50)  | Статус                               | approved / completed / error / new / rejected            |
| 6   | amount      | int4         | Сумма                                | 128182                                                   |
| 7   | currency    | varchar(12)  | Валюта                               | RUB                                                      |
| 8   | meta        | json         | Реквизиты (банк, счёт, паспорт, ИНН) | —                                                        |
| 9   | customer_id | varchar(255) | Телефон покупателя                   | +71234567890                                             |
| 10  | type        | varchar(50)  | Тип вывода                           | balance / bank_account / dummy / qiwi / tinkoff / stripe |
| 11  | manager_id  | varchar(255) | Телефон менеджера                    | —                                                        |
| 12  | commission  | int4         | Комиссия                             | 3000                                                     |

---

#### datingpost
Посты в разделе знакомств на мероприятии.

| #   | Поле        | Тип          | Описание           | Пример              |
| --- | ----------- | ------------ | ------------------ | ------------------- |
| 1   | id          | serial4      | id поста           | 4645                |
| 2   | created     | timestamp    | Дата создания      | 2023-07-24 04:18:53 |
| 3   | updated     | timestamp    | Дата обновления    | 2023-07-24 04:18:53 |
| 4   | version     | int4         | Версия             | 1                   |
| 5   | event_id    | int4         | id мероприятия     | 1215706             |
| 6   | customer_id | varchar(255) | Телефон покупателя | +71234567890        |
| 7   | body        | text         | Текст поста        | Ищу друзей          |
| 8   | hidden      | bool         | Скрыт              | TRUE / FALSE        |

---

#### event
Мероприятия.

| #   | Поле                 | Тип          | Описание                                    | Пример                                                                        |
| --- | -------------------- | ------------ | ------------------------------------------- | ----------------------------------------------------------------------------- |
| 1   | id                   | serial4      | id мероприятия                              | 2                                                                             |
| 2   | created              | timestamp    | Дата создания                               | 2019-02-13 21:26:14                                                           |
| 3   | updated              | timestamp    | Дата обновления                             | 2021-06-04 07:37:23                                                           |
| 4   | contract             | varchar(255) | id контракта                                | —                                                                             |
| 5   | currency             | varchar(12)  | Валюта                                      | EUR / RUB / USD                                                               |
| 6   | description          | text         | Описание                                    | —                                                                             |
| 7   | end                  | timestamp    | Дата завершения                             | 2019-11-30 17:00:00                                                           |
| 8   | external_id          | varchar(255) | Внешний id                                  | 5c648b51dc7f87000c79c773                                                      |
| 9   | language             | varchar(2)   | Язык                                        | ru / en                                                                       |
| 10  | name                 | varchar(255) | Название                                    | Невероятное мероприятие                                                       |
| 11  | start                | timestamp    | Дата начала                                 | 2019-08-01 07:00:00                                                           |
| 12  | venue                | json         | Место проведения (адрес, координаты, город) | —                                                                             |
| 13  | group_id             | int4         | id группы мероприятий                       | 2                                                                             |
| 14  | city_id              | varchar(10)  | id города                                   | 524901                                                                        |
| 15  | organizer_id         | int4         | id организатора                             | 1                                                                             |
| 16  | state                | varchar(10)  | Статус                                      | canceled / new / paused / published                                           |
| 17  | is_refundable        | bool         | Возврат денег за билеты                     | TRUE / FALSE                                                                  |
| 18  | resale_ready         | bool         | Готово к перепродаже                        | TRUE / FALSE                                                                  |
| 19  | min_resale_price_ppm | int4         | Минимальная цена перепродажи                | 0                                                                             |
| 20  | max_resale_price_ppm | int4         | Максимальная цена перепродажи               | 0                                                                             |
| 21  | scan_mode            | int4         | Режим сканирования                          | 10=Dynamic QR / 20=Static QR / 24=Static barcode / 25=Access code / 30=Manual |
| 22  | org_commission       | int2         | Комиссия организатора                       | 50                                                                            |
| 23  | is_chat_available    | bool         | Доступен чат мероприятия                    | TRUE / FALSE                                                                  |
| 24  | timezone             | varchar(255) | Часовой пояс                                | Europe/Vilnius                                                                |
| 25  | hidden_date          | bool         | Скрытая дата                                | TRUE / FALSE                                                                  |
| 26  | age_restriction      | int4         | Возрастное ограничение                      | —                                                                             |
| 27  | price_min            | int4         | Минимальная цена                            | —                                                                             |
| 28  | rating               | int4         | Рейтинг                                     | 0                                                                             |
| 29  | system_              | varchar(255) | Система                                     | PHANTOM / TC / TEST                                                           |

---

#### eventgroup
Группы мероприятий (мета-мероприятия).

| #   | Поле         | Тип          | Описание        | Пример                  |
| --- | ------------ | ------------ | --------------- | ----------------------- |
| 1   | id           | serial4      | id группы       | 2                       |
| 2   | created      | timestamp    | Дата создания   | 2019-02-13 21:26:14     |
| 3   | updated      | timestamp    | Дата обновления | 2023-01-19 09:12:14     |
| 4   | is_active    | bool         | Активна         | TRUE / FALSE            |
| 5   | external_id  | varchar(255) | Внешний id      | —                       |
| 6   | name         | varchar(255) | Название группы | Невероятное мероприятие |
| 7   | meta         | json         | Метаданные      | {}                      |
| 8   | organizer_id | int4         | id организатора | 1                       |
| 9   | system_      | varchar(255) | Система         | PHANTOM / TC / TEST     |

---

#### eventmarker
Отметки покупателей на мероприятиях (закладки).

|#|Поле|Тип|Описание|Пример|
|---|---|---|---|---|
|1|id|serial4|id отметки|121523|
|2|created|timestamp|Дата создания|2025-11-29 17:02:24|
|3|event_id|int4|id мероприятия|586364845|
|4|customer_id|int4|id покупателя|505709|

---

#### eventrating
Оценки мероприятий покупателями.

| #   | Поле        | Тип          | Описание        | Пример              |
| --- | ----------- | ------------ | --------------- | ------------------- |
| 1   | id          | serial4      | id оценки       | 1                   |
| 2   | created     | timestamp    | Дата создания   | 2020-02-03 15:53:10 |
| 3   | updated     | timestamp    | Дата обновления | 2020-02-03 15:53:10 |
| 4   | value       | int4         | Оценка          | 3                   |
| 5   | comment     | varchar(255) | Комментарий     | Boring              |
| 6   | event_id    | int4         | id мероприятия  | 339                 |
| 7   | customer_id | int4         | id покупателя   | 18942               |

---

#### funds
Средства, связанные с билетами и мероприятиями.

| #   | Поле           | Тип          | Описание           | Пример              |
| --- | -------------- | ------------ | ------------------ | ------------------- |
| 1   | id             | serial4      | id записи          | 8684                |
| 2   | created        | timestamp    | Дата создания      | 2024-02-20 15:45:17 |
| 3   | updated        | timestamp    | Дата обновления    | 2024-02-20 15:45:17 |
| 4   | version        | int4         | Версия             | 0 / 1               |
| 5   | amount         | int4         | Сумма              | 35000               |
| 6   | currency       | varchar(255) | Валюта             | RUB                 |
| 7   | customer_id    | varchar(255) | Телефон покупателя | +71234567890        |
| 8   | event_id       | int4         | id мероприятия     | 145754788           |
| 9   | ticket_id      | int4         | id билета          | 434393              |
| 10  | is_pending     | bool         | Ожидание           | TRUE / FALSE        |
| 11  | transaction_id | int4         | id транзакции      | 1335809             |

---

#### importlog
Лог импорта данных из внешних систем.

|#|Поле|Тип|Описание|Пример|
|---|---|---|---|---|
|1|id|serial4|id записи|51961|
|2|created|timestamp|Дата создания|2024-06-25 08:00:49|
|3|status|varchar(10)|Статус|FAIL|
|4|message|varchar(511)|Сообщение|No ticket found|
|5|external_id|varchar(255)|Внешний id|6599704bf47a001dc20173b9|
|6|topic|varchar(255)|Тема импорта|checkpoint / events / orders_done / refund_requests|

---

#### integration
Интеграции с внешними системами.

|#|Поле|Тип|Описание|Пример|
|---|---|---|---|---|
|1|id|serial4|id интеграции|1|
|2|created|timestamp|Дата создания|2019-02-22 09:22:58|
|3|updated|timestamp|Дата обновления|2019-02-22 09:22:58|
|4|is_active|bool|Активна|TRUE / FALSE|
|5|is_broken|bool|Сломана|TRUE / FALSE|
|6|type|int4|Тип интеграции|10|
|7|last_synced|timestamp|Дата последней синхронизации|2019-05-13 15:30:12|
|8|external_id|varchar(255)|Внешний id|307506547755|
|9|meta|json|Метаданные|{}|
|10|organizer_id|int4|id организатора|4|

---

#### like
Лайки на посты в дэйтинге.

| #   | Поле              | Тип          | Описание           | Пример              |
| --- | ----------------- | ------------ | ------------------ | ------------------- |
| 1   | id                | serial4      | id лайка           | 1                   |
| 2   | created           | timestamp    | Дата создания      | 2022-07-30 19:34:20 |
| 3   | customer_id       | varchar(255) | Телефон покупателя | +71234567890        |
| 4   | post_id           | int4         | id поста           | 361                 |
| 5   | written_to_author | bool         | Написано автору    | TRUE / FALSE        |

---

#### location
Локации (площадки и рестораны).

| #   | Поле        | Тип           | Описание                            | Пример                      |
| --- | ----------- | ------------- | ----------------------------------- | --------------------------- |
| 1   | system_     | varchar(255)  | Система                             | TICKETLAND / TC / MRS       |
| 2   | external_id | varchar(255)  | Внешний id                          | 68d535794ffc8616b7713ec5    |
| 3   | created     | timestamp     | Дата создания                       | 2026-04-14 00:30:45         |
| 4   | name        | varchar(255)  | Название                            | Невероятный ресторан        |
| 5   | address     | text          | Адрес                               | ул. Ленина, д. 1            |
| 6   | latitude    | numeric(10,7) | Широта                              | 55.7521010                  |
| 7   | longitude   | numeric(10,7) | Долгота                             | 37.5842820                  |
| 8   | description | text          | Описание                            | —                           |
| 9   | city_id     | varchar(10)   | id города из таблицы city           | 547523                      |
| 10  | type        | varchar(20)   | Тип                                 | venue / restaurant          |
| 11  | image       | text          | Картинка                            | NULL                        |
| 12  | tags        | json          | Подкатегории                        | ["Восточная", "кавказская"] |
| 13  | rating      | float4        | Рейтинг ресторана (у площадок NULL) | 4.7                         |

---

#### message
Сообщения в чате мероприятия.

| #   | Поле         | Тип          | Описание                   | Пример                    |
| --- | ------------ | ------------ | -------------------------- | ------------------------- |
| 1   | id           | serial4      | id сообщения               | 8136                      |
| 2   | created      | timestamp    | Дата создания              | 2020-03-02 13:44:46       |
| 3   | body         | text         | Текст сообщения            | Билетный чат?) прикольно) |
| 4   | modified     | timestamp    | Дата редактирования        | —                         |
| 5   | pinned       | bool         | Закреплено                 | TRUE / FALSE              |
| 6   | customer_id  | varchar(255) | Телефон покупателя         | +71234567890              |
| 7   | event_id     | int4         | id мероприятия             | 338                       |
| 8   | replay_id    | int4         | id родительского сообщения | 7510                      |
| 9   | is_organizer | bool         | Сообщение от организатора  | TRUE / FALSE              |
| 10  | type         | varchar(10)  | Тип                        | message / welcome         |
| 11  | is_deleted   | bool         | Удалено                    | TRUE / FALSE              |

---

#### organizer
Организаторы мероприятий.

| #   | Поле        | Тип          | Описание                                | Пример                   |
| --- | ----------- | ------------ | --------------------------------------- | ------------------------ |
| 1   | id          | serial4      | id организатора                         | 570324049                |
| 2   | created     | timestamp    | Дата создания                           | 2024-10-28 19:23:35      |
| 3   | updated     | timestamp    | Дата обновления                         | 2024-10-28 19:23:35      |
| 4   | is_active   | bool         | Активен                                 | TRUE / FALSE             |
| 5   | external_id | varchar(255) | Внешний id                              | 671fe4b43824ff92e4991b9f |
| 6   | name        | varchar(255) | Название                                | Невероятный организатор  |
| 7   | contacts    | json         | Контакты                                | {}                       |
| 8   | legals      | json         | Юридические данные (ИНН, ОГРНИП, адрес) | —                        |
| 9   | commission  | int2         | Комиссия                                | 5000                     |
| 10  | is_ready    | bool         | Готов                                   | TRUE / FALSE             |
| 11  | system_     | varchar(255) | Система                                 | PHANTOM / TC / TEST      |

---

#### promo
Промобаннеры в приложении.

| #   | Поле         | Тип          | Описание              | Пример                  |
| --- | ------------ | ------------ | --------------------- | ----------------------- |
| 1   | id           | serial4      | id промобаннера       | 207                     |
| 2   | created      | timestamp    | Дата создания         | 2025-09-01 08:57:20     |
| 3   | updated      | timestamp    | Дата обновления       | 2024-08-27 12:44:14     |
| 4   | is_active    | bool         | Активен               | TRUE / FALSE            |
| 5   | title        | varchar(255) | Заголовок             | Невероятный промобаннер |
| 6   | subtitle     | varchar(255) | Подзаголовок          | —                       |
| 7   | picture      | varchar(255) | Картинка (URL)        | —                       |
| 8   | meta         | json         | Список id мероприятий | {"events": [...]}       |
| 9   | dtstart      | timestamp    | Дата начала           | 2023-01-26 10:00:00     |
| 10  | dtend        | timestamp    | Дата завершения       | 2023-01-29 23:59:00     |
| 11  | button_title | varchar(255) | Название кнопки       | Купить билет            |
| 12  | clicks       | int4         | Клики по кнопке       | 1000                    |
| 13  | priority     | int4         | Приоритет             | 1                       |

---

#### push
Push-уведомления.

| #   | Поле     | Тип          | Описание            | Пример                                 |
| --- | -------- | ------------ | ------------------- | -------------------------------------- |
| 1   | id       | serial4      | id пуша             | 304                                    |
| 2   | created  | timestamp    | Дата создания       | 2025-12-05 10:30:06                    |
| 3   | name     | varchar(64)  | Внутреннее имя      | Невероятный пуш                        |
| 4   | title    | varchar(64)  | Заголовок           | Невероятный пуш                        |
| 5   | message  | varchar(250) | Текст сообщения     | Текст невероятного пуша                |
| 6   | deeplink | varchar(250) | Ссылка              | https://web.vibeapp.ru/...             |
| 7   | type     | varchar(15)  | Тип                 | events / org / csv_or_xlsx / customers |
| 8   | sent_at  | timestamp    | Дата отправки       | 2025-12-05 10:30:06                    |
| 9   | status   | varchar(10)  | Статус              | new / sent                             |
| 10  | meta     | json         | Метаданные          | {"events": [...]}                      |
| 11  | sent     | int4         | Количество отправок | 24                                     |
| 12  | category | varchar(10)  | Категория           | ads / award                            |

---

#### reaction
Реакции на сообщения в чате.

| #   | Поле        | Тип          | Описание           | Пример              |
| --- | ----------- | ------------ | ------------------ | ------------------- |
| 1   | id          | serial4      | id реакции         | 1                   |
| 2   | created     | timestamp    | Дата создания      | 2020-09-17 13:13:44 |
| 3   | code        | varchar(4)   | Реакция (эмодзи)   | 😀                  |
| 4   | message_id  | int4         | id сообщения       | 10739               |
| 5   | customer_id | varchar(255) | Телефон покупателя | +71234567890        |

---

#### receipt
Фискальные чеки.

| #   | Поле        | Тип          | Описание                  | Пример                                      |
| --- | ----------- | ------------ | ------------------------- | ------------------------------------------- |
| 1   | id          | serial4      | id чека                   | 1781                                        |
| 2   | created     | timestamp    | Дата создания             | 2020-03-25 08:01:09                         |
| 3   | request_id  | varchar(255) | id запроса                | ord-1234-5                                  |
| 4   | rtype       | varchar(255) | Тип                       | order_refund / order_income / ticket_refund |
| 5   | status      | varchar(255) | Статус                    | fail / success                              |
| 6   | response    | json         | Ответ фискального сервиса | —                                           |
| 7   | customer_id | varchar(255) | Телефон покупателя        | +71234567890                                |
| 8   | order_id    | int4         | id заказа                 | 1044                                        |
| 9   | request     | json         | Тело запроса              | —                                           |

---

#### subscription
Платные подписки (абонементы) — данные по старой функциональности.

| #   | Поле             | Тип          | Описание            | Пример               |
| --- | ---------------- | ------------ | ------------------- | -------------------- |
| 1   | id               | serial4      | id подписки         | 2                    |
| 2   | created          | timestamp    | Дата создания       | 2020-02-17 21:39:01  |
| 3   | updated          | timestamp    | Дата обновления     | 2020-02-17 21:39:01  |
| 4   | description      | text         | Описание            | Невероятная подписка |
| 5   | is_active        | bool         | Активна             | TRUE / FALSE         |
| 6   | name             | varchar(255) | Название            | Невероятная подписка |
| 7   | sys_fee_ppm      | int4         | Цена подписки       | 100000               |
| 8   | payment_interval | varchar(10)  | Период оплаты       | day / month          |
| 9   | payment_period   | int2         | Оплачиваемый период | 1                    |
| 10  | currency         | varchar(12)  | Валюта              | RUB                  |
| 11  | organizer_id     | int4         | id организатора     | 6                    |

---

#### systemorder
Основная таблица заказов вайба из БД Ядра.

| #   | Поле        | Тип          | Описание           | Пример                   |
| --- | ----------- | ------------ | ------------------ | ------------------------ |
| 1   | system_     | varchar(255) | Система            | TC                       |
| 2   | external_id | varchar(255) | Внешний id заказа  | 69c12e212ac81ae4a325f175 |
| 3   | currency    | varchar(12)  | Валюта             | RUB / EUR / USD          |
| 4   | amount      | int8         | Сумма (в копейках) | 440000                   |
| 5   | origin      | varchar(255) | Источник           | vibe / tc / tl           |
| 6   | done_at     | timestamp    | Дата оплаты        | 2026-03-23 12:16:07      |
| 7   | created_at  | timestamp    | Дата создания      | 2026-03-23 12:16:08      |
| 8   | number      | varchar(255) | Номер заказа       | 101353857                |
| 9   | customer_id | varchar(255) | Телефон покупателя | +71234567890             |

---

#### ticket
Билеты.

| #   | Поле          | Тип          | Описание                 | Пример                       |
| --- | ------------- | ------------ | ------------------------ | ---------------------------- |
| 1   | id            | serial4      | id билета                | 1                            |
| 2   | created       | timestamp    | Дата создания            | 2019-02-13 21:27:57          |
| 3   | updated       | timestamp    | Дата обновления          | 2019-04-05 09:54:37          |
| 4   | external_id   | varchar(255) | Внешний id               | 5c648b63e977f90001015145     |
| 5   | barcode       | varchar(50)  | Штрихкод                 | 15744945903598400            |
| 6   | status        | varchar(10)  | Статус                   | active / refunded / used     |
| 7   | uses          | int2         | Количество использований | 0                            |
| 8   | category      | varchar(255) | Категория билета         | Танцевальный партер          |
| 9   | type          | varchar(50)  | Тип                      | common / invitation          |
| 10  | seat          | json         | Место                    | {"row": "2", "number": "21"} |
| 11  | customer_id   | varchar(255) | Телефон покупателя       | +71234567890                 |
| 12  | event_id      | int4         | id мероприятия           | 4                            |
| 13  | sale_price    | int4         | Цена продажи             | 3                            |
| 14  | price_last    | int4         | Последняя цена           | —                            |
| 15  | version       | int4         | Версия                   | 3                            |
| 16  | currency      | varchar(12)  | Валюта                   | EUR / RUB / USD              |
| 17  | price_nominal | int4         | Номинальная цена         | 0                            |
| 18  | is_blocked    | bool         | Заблокирован             | TRUE / FALSE                 |
| 19  | refundable    | bool         | Доступен возврат         | TRUE / FALSE                 |
| 20  | allocated     | timestamp    | Время аллокации          | 2019-02-16 10:23:05          |
| 21  | system_       | varchar(255) | Система                  | PHANTOM / TEST / TC          |
| 22  | is_smart      | bool         | Смарт-билет              | TRUE / FALSE                 |

---

#### ticketcategory
Категории билетов мероприятия.

|#|Поле|Тип|Описание|Пример|
|---|---|---|---|---|
|1|id|serial4|id категории|46173548|
|2|external_id|varchar(255)|Внешний id|66a91592bee78f48b6dcd807|
|3|name|varchar(255)|Название категории|Танцевальный партер|
|4|description|text|Описание|До 16 лет включительно|
|5|event_id|int4|id мероприятия|575631366|
|6|system_|varchar(255)|Система|TC|

---

#### ticketorder
Заказы в разрезе билетов.

| #   | Поле           | Тип          | Описание              | Пример                                            |
| --- | -------------- | ------------ | --------------------- | ------------------------------------------------- |
| 1   | id             | serial4      | id заказа             | 41505                                             |
| 2   | created        | timestamp    | Дата создания         | 2023-12-02 07:13:30                               |
| 3   | updated        | timestamp    | Дата обновления       | 2023-12-02 07:13:30                               |
| 4   | version        | int4         | Версия                | 1                                                 |
| 5   | source         | varchar(255) | Источник оплаты       | cloudpayments / qiwi / stripe / balance / tinkoff |
| 6   | source_id      | varchar(255) | id источника оплаты   | e52e463b-...                                      |
| 7   | is_finished    | bool         | Завершён              | TRUE / FALSE                                      |
| 8   | is_paid        | bool         | Оплачен               | TRUE / FALSE                                      |
| 9   | is_succeeded   | bool         | Успешно               | TRUE / FALSE                                      |
| 10  | total_price    | int4         | Общая стоимость       | 99000                                             |
| 11  | customer_id    | varchar(255) | Телефон покупателя    | +71234567890                                      |
| 12  | ticket_id      | int4         | id билета             | 398302                                            |
| 13  | currency       | varchar(12)  | Валюта                | EUR / BONUS_RUB / RUB / USD                       |
| 14  | seller_id      | varchar(255) | Телефон продавца      | +71234567890                                      |
| 15  | org_fee        | int4         | Комиссия организатора | 60000                                             |
| 16  | price_last     | int4         | Последняя цена        | 180000                                            |
| 17  | transaction_id | int4         | id транзакции         | 1208208                                           |
| 18  | is_refunded    | bool         | Возвращён             | TRUE / FALSE                                      |

---

#### tickettransaction
Транзакции по билетам (перепродажи, возвраты и т.д.)

| #   | Поле        | Тип          | Описание           | Пример                                             |
| --- | ----------- | ------------ | ------------------ | -------------------------------------------------- |
| 1   | id          | serial4      | id транзакции      | 30214                                              |
| 2   | created     | timestamp    | Дата создания      | 2019-11-05 16:38:22                                |
| 3   | updated     | timestamp    | Дата обновления    | 2019-11-05 16:38:22                                |
| 4   | operation   | varchar(50)  | Операция           | redeem / sell / transfer / refund / buy / allocate |
| 5   | ticket_id   | int4         | id билета          | 18022                                              |
| 6   | is_finished | bool         | Завершена          | TRUE / FALSE                                       |
| 7   | owner_id    | varchar(255) | Телефон владельца  | +71234567890                                       |
| 8   | customer_id | varchar(255) | Телефон покупателя | +71234567890                                       |
| 9   | status      | bool         | Статус транзакции  | TRUE / FALSE                                       |

---

### Связи между таблицами

```
ticket.event_id              → event.id
ticket.customer_id           → customer.phone

ticketorder.ticket_id        → ticket.id
ticketorder.customer_id      → customer.phone

tickettransaction.ticket_id  → ticket.id

ticketcategory.event_id      → event.id

customertransaction.ticket_id → ticket.id
customertransaction.event_id  → event.id
customertransaction.customer_id → customer.phone

customercampaign.campaign_id → campaign.id
customercampaign.customer_id → customer.phone
customercampaign.event_id    → event.id

customersubscription.subscription_id → subscription.id
customersubscription.customer_id     → customer.phone

customerwithdrawal.customer_id → customer.phone

customerevent.event_id       → event.id
customerevent.customer_id    → customer.phone

event.organizer_id           → organizer.id
event.group_id               → eventgroup.id
event.city_id                → city.id

eventgroup.organizer_id      → organizer.id

eventrating.event_id         → event.id
eventrating.customer_id      → customer.id

eventmarker.event_id         → event.id
eventmarker.customer_id      → customer.id

datingpost.event_id          → event.id
datingpost.customer_id       → customer.phone

like.post_id                 → datingpost.id
like.customer_id             → customer.phone

message.event_id             → event.id
message.customer_id          → customer.phone

reaction.message_id          → message.id
reaction.customer_id         → customer.phone

complaint.event_id           → event.id

receipt.order_id             → ticketorder.id
receipt.customer_id          → customer.phone

funds.event_id               → event.id
funds.ticket_id              → ticket.id
funds.customer_id            → customer.phone

balance.organizer_id         → organizer.id
balance.customer_id          → customer.phone

booking.location_id          → location.id
booking.customer_id          → customer.phone

location.city_id             → city.id

integration.organizer_id     → organizer.id

systemorder.customer_id      → customer.phone

adminhistory.event_id        → event.id
adminhistory.ticket_id       → ticket.id
```