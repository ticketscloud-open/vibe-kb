[[Checkpoint]]
## SMART (base)

**SMART** — это формат для генерации динамических (привязанных ко времени) билетных кодов для систем контроля доступа (**СКД**).
### Глоссарий

- **pid** — публичный идентификатор билета (ID билета в системе, которая его выпустила).
- **secret** — приватный ключ билета (приватная информация, обычно это штрихкод).
- **meta** — дополнительная публичная информация о билете (например, последние четыре цифры телефона текущего владельца). Формат по умолчанию не регламентируется, также возможна пустая строка.
- **timestamp** — время генерации смарткода в формате **UNIX timestamp** в секундах.
- **signature** — 16-байтовый хеш **MD5**, сформированный на основе склеенных данных: `{pid}{timestamp}{meta}{secret}`.

### Формат

Смарткод всегда начинается с префикса `smart{version}://`, где версия указывается после "smart". В примере ниже используется версия `1`:

`smart1://{pid}:{timestamp}{signature}@{meta}`

Если **pid** или **meta** содержат символы `:/@`, их следует экранировать с использованием **URL encoding**.

> [!note]- В значении **timestamp** ожидается 10 байт в строковом представлении
> Таким образом допустимый временный интервал от 1000000000 (2001-09-09) до 9999999999 (2286-11-20). Актуальное время до 2286 года не требует дополнительных действий.

Пример кода, сгенерированного 12 сентября 2024 года:

`smart1://66dac79111f4f5558b5e9374:1726136260561b3b1949528b349629c6d832ecf5dc@3620`

### Генерация

Для генерации **MD5** подписи на основе билетных данных можно использовать следующий код на Node.js:

```javascript
const crypto = require('crypto')

function encode(pid: string, secret: string, meta: string) {
	const timestamp = Math.floor(Date.now() / 1000)
	const sign_part = `${pid}${timestamp}${meta}${secret}`
	const signature = crypto.createHash('md5').update(sign_part).digest('hex')
	return `smart1://${pid}:${timestamp}${signature}@${meta}`
}

```

### Процессинг

Пример обработки смарткода с максимальным временем жизни (TTL) в 10 секунд:

```javascript
const crypto = require('crypto')

const smart1Re = /smart1:\/\/(?<pid>.*):(?<ts>\d{10})(?<sign>.*)@(?<meta>.*)/

function parse(code, ttl = 10) {
  const match = smart1Re.exec(code)
  if (!match) throw new Error('Invalid Code')
  const groups = match.groups
  const currentTime = Math.floor(Date.now() / 1000)
  if (currentTime > (parseInt(groups.ts) + ttl)) throw new Error('Code is outdated')
  return groups
}

function decode(code, secret, ttl = 10) {
  const groups = parse(code, ttl)
  const sign_part = `${groups.pid}${groups.ts}${groups.meta}${secret}`
  const signature = crypto.createHash('md5').update(sign_part).digest('hex')
  if (signature !== groups.sign) throw new Error('Code is invalid')
  return groups
}
```

1. Первым шагом происходит разбор кода, проверка актуальности `timestamp`, и получение **pid**. Это можно сделать через вызов `const groups = parse(code)` и использование `groups.pid`.
2. По полученному **pid** сервис загружает информацию о билете и получает **secret** (штрихкод в версии 1).
3. Затем сервис проверяет валидность подписи через `decode(code, secret)`.
4. Опционально можно использовать данные из **meta** для дополнительной проверки (например, соответствие номера телефона владельца билета).

### Примечания

Система предполагает, что штрихкод не будет доступен пользователю. Билет должен обладать уникальным **pid** в рамках мероприятия, по которому можно однозначно идентифицировать билет. В системе контроля доступа заранее загружаются данные о билетах.

## SMART v1

В версии 1 в качестве **secret** используется цифровой штрихкод билета, а в **meta** ожидаются последние четыре цифры телефона владельца билета.

**СКД** находит билет по **pid**, проверяет подпись с использованием штрихкода, а также соответствие данных в **meta** привязанному номеру телефона.

> [!note] Если в СКД нет данных о телефоне владельца, **meta** игнорируется