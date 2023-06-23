# Указываем базовый образ
FROM swift:latest

# Копируем файлы Package.swift и исходный код проекта в контейнер
COPY Package.swift /app/
COPY Sources/PRManager /app/Sources/PRManager

# Устанавливаем рабочую директорию
WORKDIR /app

# Устанавливаем зависимости проекта с помощью Swift Package Manager
RUN swift package resolve

# Компилируем проект
RUN swift build

# Указываем команду, которая будет запущена при запуске контейнера
CMD [".build/debug/PRManager"]