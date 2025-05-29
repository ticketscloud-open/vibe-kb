---
aliases:
  - Смарткод
---
[[Checkpoint]]

## SMART (base)

**SMART** — формат для генерации динамических (временных) билетных кодов для систем контроля доступа (**СКД**).  

### 📌 Назначение

Формат используется для безопасного входа на мероприятия и интегрируется в системы контроля доступа (СКД).  

Каждый код содержит публичную информацию, а также встроенную подпись и метаданные.

### 🧩 Формат смарткода

Смарткод всегда начинается с префикса `smart{version}://`.  
Пример для версии `1`:

```
smart1://{pid}:{timestamp}{signature}@{meta}
            |      |          |        |
            |      |          |        └─ необязательные публичные данные
            |      |          └───────── MD5(pid+timestamp+meta+secret)
            |      └──────────────────── UNIX timestamp (10 цифр)
            └─────────────────────────── публичный ID билета
```

### 🧾 Глоссарий

- **pid** — публичный идентификатор билета (уникальный ID в системе)
- **timestamp** — UNIX-время генерации (в секундах, 10 символов)
- **secret** — приватный ключ (в v1 — цифровой штрихкод)
- **meta** — необязательные публичные данные, например: `3620` (последние цифры телефона)
- **signature** — MD5-хеш из `{pid}{timestamp}{meta}{secret}` (32 символа)

> Если `pid` или `meta` содержат символы `:/@`, они должны быть закодированы через URL encoding.

> [!note]- В значении **timestamp** ожидается 10 символов в строковом представлении.
> Таким образом, допустимый временной интервал — от 1000000000 (2001-09-09) до 9999999999 (2286-11-20). Актуальное время до 2286 года не требует дополнительных действий.

> [!warning] Примечание
> Система предполагает, что штрихкод не будет доступен пользователю. Билет должен иметь уникальный **pid** в рамках мероприятия, по которому можно однозначно идентифицировать билет. В систему контроля доступа заранее загружаются данные о билетах.

### 🧪 Пример смарт-кода

Дата: **12 сентября 2024**, timestamp: `1726136260`

`smart1://66dac79111f4f5558b5e9374:1726136260561b3b1949528b349629c6d832ecf5dc@3620`

### ⚙️ Пример генерации смарткода (Node.js)

```js
const crypto = require('crypto')

function encode(pid, secret, meta = "") {
  const timestamp = Math.floor(Date.now() / 1000)
  const sign_part = `${pid}${timestamp}${meta}${secret}`
  const signature = crypto.createHash('md5').update(sign_part).digest('hex')
  return `smart1://${pid}:${timestamp}${signature}@${meta}`
}

// Использование:
const ticket = { id: "42", barcode: "555666777888" }
const smartcode = encode(ticket.id, ticket.barcode)
// smart1://42:1726136260...@...
```

### 🔐 Пример валидация смарткода (Node.js)

```javascript
const crypto = require('crypto')

const smart1Re = /smart1:\/\/(?<pid>[^:]+):(?<ts>\d{10})(?<sign>[a-f0-9]{32})@(?<meta>.*)/

function parse(smartcode, ttl = 10) {
  const match = smart1Re.exec(smartcode)
  if (!match) throw new Error('Invalid Smartcode')
  const { pid, ts, sign, meta } = match.groups
  const currentTime = Math.floor(Date.now() / 1000)
  if (currentTime > (parseInt(ts) + ttl)) throw new Error('Smartcode is outdated')
  return { pid, ts, sign, meta }
}

function decode(smartcode, secret, ttl = 10) {
  const { pid, ts, sign, meta } = parse(smartcode, ttl)
  const sign_part = `${pid}${ts}${meta}${secret}`
  const expected = crypto.createHash('md5').update(sign_part).digest('hex')
  if (expected !== sign) throw new Error('Smartcode is invalid')
  return { pid, meta }
}
```

#### 🔁 Поток верификации

1. Извлекаем данные через parse(code)
2. Получаем secret по pid (например, из базы данных)
3. Проверяем подпись через decode(code, secret)
4. *(Опционально)* Сравниваем meta с привязкой (например, последние цифры телефона)

### 🚧 Частые ошибки

- timestamp не 10 символов → ошибка парсинга
- забыли делить Date.now() на 1000 → миллисекунды вместо секунд
- meta не экранирована (включает : или @) → недопустимый формат
- порядок параметров при подписи отличается → неверный хеш

### 🧠 Частые вопросы

**Можно ли использовать timestamp в миллисекундах?**

✘ Нет. Используется только **UNIX timestamp в секундах** (10 символов)

**Можно ли не указывать meta?**

✔ Да. Просто используйте @.

**Что делать, если секрет известен пользователю?**

Такой случай не предполагается в v1. Используйте дополнительную валидацию на стороне сервера.

## SMART v1

- **secret**: цифровой штрихкод билета
- **meta**: 4 последние цифры телефона владельца

**СКД**:
- ищет билет по pid
- сверяет подпись через secret
- (если доступен телефон) сверяет meta

> [!tip] Если в СКД нет данных о телефоне владельца, meta можно игнорировать

## 🔄 План на SMART v2 (будущее)

- HMAC-SHA256 вместо MD5
- Поддержка асимметричной подписи
- Расширенный JSON-формат meta
- Встроенный exp (истекает) внутри кода