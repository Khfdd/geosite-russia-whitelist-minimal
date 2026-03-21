# Geosite Russia Whitelist Minimal

Минимальный набор geosite/geoip категорий для маршрутизации трафика в России.

## Download

- **geosite.dat**: [https://cdn.jsdelivr.net/gh/Khfdd/geosite-russia-whitelist-minimal@main/output/geosite.dat](https://cdn.jsdelivr.net/gh/Khfdd/geosite-russia-whitelist-minimal@main/output/geosite.dat)
- **geoip.dat**: [https://cdn.jsdelivr.net/gh/Khfdd/geosite-russia-whitelist-minimal@main/output/geoip.dat](https://cdn.jsdelivr.net/gh/Khfdd/geosite-russia-whitelist-minimal@main/output/geoip.dat)

## Категории

| Категория | Содержимое |
|-----------|-----------|
| `geosite:category-ads` | Рекламные домены |
| `geosite:microsoft` | Домены Microsoft |
| `geosite:private` | Зарезервировано (внутренние домены) |
| `geoip:private` | Приватные IP-подсети (RFC 1918, loopback) |
| `geosite:torrent` | Торрент-трекеры |
| `geosite:whitelist` | Российские сайты, доступные напрямую |
| `geosite:win-spy` | Телеметрия и слежка Windows |

## Пример конфига

Маршрутизация зависит от твоих задач. Базовый пример для Xray/V2Ray:

```json
"routing": {
  "domainStrategy": "IPIfNonMatch",
  "rules": [
    {
      "type": "field",
      "outboundTag": "block",
      "domain": [
        "geosite:win-spy",
        "geosite:category-ads",
        "geosite:torrent"
      ]
    },
    {
      "type": "field",
      "outboundTag": "direct",
      "domain": [
        "geosite:microsoft",
        "geosite:private",
        "geosite:whitelist"
      ]
    },
    {
      "type": "field",
      "outboundTag": "direct",
      "ip": [
        "geoip:private"
      ]
    }
  ]
}
```
