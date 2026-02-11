#[
  #show figure: set block(breakable: true)
  #figure(
    {
      ```bash
      FROM nvidia/cuda:13.0.1-base-ubuntu24.04 AS python-base

      ENV PYTHONUNBUFFERED=1 \
          DEBIAN_FRONTEND=noninteractive \
          UV_COMPILE_BYTECODE=1 \
          UV_LINK_MODE=copy \
          UV_PYTHON_INSTALL_DIR=/python \
          UV_PYTHON_PREFERENCE=only-managed \
          LANG=de_DE.UTF-8 \
          LANGUAGE=de_DE:de \
          LC_ALL=de_DE.UTF-8

      RUN apt-get update && \
          apt-get install --no-install-recommends -y \
          libgl1 \
          libglib2.0-0 \
          git \
          nano \
          locales \
          && sed -i -e 's/# de_DE.UTF-8 UTF-8/de_DE.UTF-8 UTF-8/' /etc/locale.gen \
          && locale-gen \
          && rm -rf /var/lib/apt/lists/*

      ### Builder
      FROM python-base AS builder

      # Installiere uv und Python
      COPY --from=ghcr.io/astral-sh/uv:latest /uv /usr/local/bin/uv
      RUN uv python install 3.12

      WORKDIR /app

      # Installiere die Abhängigkeiten / Pakete
      COPY uv.lock pyproject.toml README.md ./
      RUN --mount=type=cache,target=/root/.cache/uv \
          uv sync --locked --no-install-project --no-dev


      ### Runtime
      FROM python-base AS runtime

      # Copiere die Python-Installation und die erstellte .venv
      COPY --from=builder --chown=python:python /python /python
      COPY --from=builder /app /app

      # Aktualisiere den PATH
      ENV PATH="/app/.venv/bin:$PATH"

      # Nutze `/app` als Arbeitsverzeichnis
      WORKDIR /app
      ```
    },
    caption: [Multi-Stage Dockerfile für das Training des Agenten.],
  ) <dockerfile>
]
