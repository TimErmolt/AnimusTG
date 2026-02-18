## Название: Расы с OnyxBay

**MODULE ID:** onyx_species

**Pull Request:** https://github.com/ChaoticOnyx/AnimusTG/pull/5

### Описание:

Добавляет некоторые расы с билда OnyxBay: таяр, скреллов и воксов. Расы доступны для выбора в сетапе.

<!-- TODO: описание механа каждой из рас -->

### Изменения файлов или проков TG:

`/datum/controller/subsystem/accessories/setup_lists()` -- в конец прока присоединены инициализации спрайтовых аксессуаров для новых рас.

### Дефайны:

SPECIES_TAJARA -- "tajara"
SPECIES_SKRELL -- "skrell"
SPECIES_VOX -- "vox"

FEATURE_EARS_TAJARA -- "ears_tajara"
FEATURE_TAIL_TAJARA -- "tail_tajara"
FEATURE_SKRELL_HAIR -- "skrell_hair"
FEATURE_VOX_HAIR -- "vox_hair"

### Авторы:

**TheUnknownOne (aka Tim Ermolt)** -- код, работа со спрайтами;
**FloweYStyle** -- геймдизайн, помощь с кодом, моральная поддержка.
