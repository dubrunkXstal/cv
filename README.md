# Сенюта Добрыня Александрович

### Локальная сборка

```bash
docker build --build-arg BASE="$(python3 choose_system.py)" -t cv-builder .
docker run --rm -v "$PWD":/work -w /work cv-builder
```
