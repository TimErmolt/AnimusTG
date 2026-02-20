## Название: Статус в хабе

**MODULE ID:** hub_status

**Pull Request:** https://github.com/ChaoticOnyx/AnimusTG/pull/7

### Описание:

Изменяет стандартную логику формирования описания сервера в BYOND-хабе на кастомную для Эребуса. Изменять пункты описания можно через конфиг.

### Изменения файлов или проков TG:

- `code/game/world.dm`
-- `/world/update_status()` -- полностью переопределён в `code/world.dm`

- `config/config.txt`
-- Добавлены пункты `DISCORD_LINK`, `HUB_TAGLINE1`, `HUB_TAGLINE2` (соответствующие датумы в коде -- в файле `code/configuration.dm`)

### Авторы:

**TheUnknownOne (aka Tim Ermolt)**
