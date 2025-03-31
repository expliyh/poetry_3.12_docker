# Dockerfile for Python project with Poetry 3.12 only

# Use official Python 3.12 image
FROM python:3.12-slim

# Install system dependencies (if needed)
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Install Poetry without virtualenvs
ENV POETRY_VERSION=2.1
ENV POETRY_HOME=/opt/poetry
ENV PATH="$POETRY_HOME/bin:$PATH"

RUN curl -sSL https://install.python-poetry.org | python3 - \
    && poetry config virtualenvs.create false

WORKDIR /app

# Verify Poetry installation
CMD ["poetry", "--version"]