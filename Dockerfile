# Указываем базовый образ
FROM swift:latest

# Копируем файлы проекта в контейнер
COPY . /app

# Устанавливаем рабочую директорию
WORKDIR /app

# Устанавливаем зависимости проекта с помощью Swift Package Manager
RUN swift package resolve

# Компилируем проект
RUN swift build

# Указываем команду, которая будет запущена при запуске контейнера
CMD [".build/debug/PRManager"]