# Используем образ Swift
FROM swift:latest

# Копируем файлы проекта в контейнер
COPY src /Autobots

# Устанавливаем рабочую директорию
WORKDIR /Autobots

# Собираем проект
RUN swift build -c release

# Запускаем приложение
CMD [".build/release/Autobots"]