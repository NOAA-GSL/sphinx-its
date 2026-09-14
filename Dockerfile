# Stage 1: Build Sphinx static files
FROM python:3.11-slim AS builder
WORKDIR /docs

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Automatically initialize Sphinx if conf.py is missing, then compile HTML
RUN if [ ! -f conf.py ]; then \
        sphinx-quickstart --quiet -p "ITS Documentation" -a "NOAA" -v "1.0" . ; \
    fi && \
    sphinx-build -b html . _build/html

# Stage 2: Serve via Nginx
FROM nginx:alpine
COPY --from=builder /docs/_build/html /usr/share/nginx/html
EXPOSE 80