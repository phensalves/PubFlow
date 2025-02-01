# Dockerfile for external-sales-api (Python)
FROM python:3.9

# Create app directory
WORKDIR /app

# Copy project dependencies
COPY requirements.txt ./

# Install dependencies
RUN pip install -r requirements.txt

# Copy remaining project files
COPY . .

# Expose API port
EXPOSE 5001

# Default command
CMD ["python", "app.py"]
