# Используем образ Swift
FROM swift:latest

# Копируем файлы проекта в контейнер
COPY src /app

# Устанавливаем зависимости и выполняем сборку проекта
RUN cd /app && \
    swift build

# Определяем команду по умолчанию для запуска в контейнере
CMD ["swift", "run", "--package-path", "/app"]