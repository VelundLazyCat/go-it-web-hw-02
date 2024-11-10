# Наш базовий образ - це Linux з попередньо встановленим python-3.12
FROM python:3.12
ENV APP_HOME /app

# Встановимо робочу директорію всередині контейнера
WORKDIR  $APP_HOME


# Встановимо залежності всередині контейнера
COPY pyproject.toml $APP_HOME/pyproject.toml


RUN pip install poetry
RUN poetry config virtualenvs.create false && poetry install --only main

# Скопіюємо інші файли в робочу директорію контейнера
COPY . .

# Запустимо наш застосунок всередині контейнера
ENTRYPOINT ["python", "main.py"]
