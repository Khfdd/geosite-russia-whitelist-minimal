# Geosite Russia Whitelist Minimal

Набор доменных и IP-списков для маршрутизации трафика в российских сетях. Проект собирает файлы из каталога `data` в бинарные базы формата Xray/V2Ray.

Проект не определяет, какой трафик нужно блокировать или проксировать. Назначение списка задаётся правилами маршрутизации вашего клиента.

## Скачать

- [`geosite.dat`](https://cdn.jsdelivr.net/gh/Khfdd/geosite-russia-whitelist-minimal@main/output/geosite.dat) — доменные списки
- [`geoip.dat`](https://cdn.jsdelivr.net/gh/Khfdd/geosite-russia-whitelist-minimal@main/output/geoip.dat) — IP-списки
- [`routing.json`](https://cdn.jsdelivr.net/gh/Khfdd/geosite-russia-whitelist-minimal@main/output/routing.json) — пример настроек маршрутизации VPNHUB

## Списки

Каждый файл в `data` становится списком `geosite:<имя-файла>`. Основные составные списки:

| Список | Назначение |
| --- | --- |
| `geosite:category-direct` | Домены, которые следует отправлять напрямую |
| `geosite:category-proxy` | Домены, которые следует отправлять через прокси |
| `geosite:category-block` | Рекламные и другие заблокированные домены |
| `geosite:category-ru` | Основные российские домены и зоны |
| `geosite:category-whitelist` | Российские сайты из белого списка |
| `geosite:private` | Внутренние домены и служебные адреса |
| `geosite:category-ads` | Рекламные домены |
| `geosite:microsoft` | Домены Microsoft |
| `geosite:win-spy` | Телеметрия Windows |
| `geosite:torrent` | Торрент-трекеры |

Полный набор списков находится в каталоге [`data`](./data).

## Пример для Xray/V2Ray

```json
{
  "routing": {
    "domainStrategy": "IPIfNonMatch",
    "rules": [
      {
        "type": "field",
        "outboundTag": "block",
        "domain": ["geosite:category-block"]
      },
      {
        "type": "field",
        "outboundTag": "direct",
        "domain": ["geosite:category-direct", "geosite:category-ru"],
        "ip": ["geoip:private", "geoip:ru"]
      },
      {
        "type": "field",
        "outboundTag": "proxy",
        "domain": ["geosite:category-proxy"]
      }
    ]
  }
}
```

Имена `block`, `direct` и `proxy` должны совпадать с тегами исходящих подключений в конфигурации клиента.

## Локальная сборка

Требуется Go версии, указанной в [`go.mod`](./go.mod) (сейчас `go 1.24.0`):

```bash
git clone https://github.com/Khfdd/geosite-russia-whitelist-minimal.git
cd geosite-russia-whitelist-minimal
go mod download
go run . -datapath ./data -outputdir ./output -outputname geosite.dat
```

Генератор создаёт бинарный файл в `output/geosite.dat`. Исходные списки можно изменять в `data`, затем повторить команду сборки. Для просмотра всех параметров используйте `go run . -h`.

Скрипт [`gen.sh`](./gen.sh) дополнительно загружает обновления из внешних источников и пересобирает список. Проверьте URL и команды публикации в скрипте перед запуском.

## Формат исходных файлов

В `data` поддерживаются обычные домены и правила:

```text
domain:example.com
full:login.example.com
keyword:example
regexp:^cdn[0-9]+\.example\.com$
include:another-list
```

Пустые строки и строки, начинающиеся с `#`, игнорируются. Подробнее о формате генератора см. в [`main.go`](./main.go).

## Лицензия

Код проекта распространяется по лицензии [MIT](./LICENSE). Для отдельных доменных списков могут действовать лицензии и условия их исходных проектов.
