# Stage 1: Build Vue frontend
FROM node:18 AS frontend-builder

WORKDIR /app/frontend
COPY frontend/ .
RUN npm install && npm run build

# Stage 2: Build Python Flask backend with built frontend
FROM python:3.10-slim

# Install Python dependencies
WORKDIR /app
COPY backend/ ./backend/
COPY backend/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy built frontend from stage 1 into backend's static directory
COPY --from=frontend-builder /app/frontend/dist ./frontend-dist

# Environment
ENV FLASK_APP=backend/app.py
ENV PYTHONUNBUFFERED=True
ENV REDIS_HOST=redis

EXPOSE 5000

# Run Flask app
CMD ["python", "backend/app.py"]
