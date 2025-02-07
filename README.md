# PubFlow - Data-Driven Publishing Analytics

PubFlow is a data-driven analytics platform designed for a publishing company. It collects, processes, and analyzes sales data from multiple external sources to provide insights into customer behavior, seasonal trends, and recommendations for future publications.

## Tech Stack

- **Backend API**: Ruby on Rails 8 (API-Only)
- **Frontend**: Next.js with Chart.js for interactive data visualization
- **Database**: PostgreSQL with OpenSearch for advanced search capabilities
- **ETL Service**: Python with Apache Airflow for data ingestion and processing
- **Task Queue**: Celery + Redis for asynchronous processing
- **Infrastructure**: Docker + Kubernetes for container orchestration
- **Cloud Deployment**: AWS (S3, RDS, Lambda, ECS) / GCP (Cloud Run, BigQuery, GCS)
- **CI/CD**: GitHub Actions for automated testing and deployment

## Architecture Overview

1. **Data Ingestion**: External sales data is collected via APIs (Amazon, Shopee, Mercado Livre) using Python ETL pipelines managed with Apache Airflow.
2. **Processing & Storage**: The ETL service processes and stores structured data in PostgreSQL while OpenSearch enables fast and efficient queries.
3. **API Services**: A Ruby on Rails API provides endpoints for frontend data access and analytics.
4. **Frontend Visualization**: Next.js with Chart.js offers interactive dashboards and analytics insights.
5. **Asynchronous Tasks**: Background jobs run on Celery with Redis to ensure smooth data processing.
6. **Cloud Deployment & Scaling**: Dockerized services deployed on AWS/GCP with Kubernetes for auto-scaling and load balancing.

## Getting Started

1. Clone the repository:
   ```sh
   git clone https://github.com/your-repo/pubflow.git
   cd pubflow
   ```

2. Run services with Docker:
   ```sh
   docker-compose up --build
   ```

3. Access the API at `http://localhost:3000`
4. Access the frontend dashboard at `http://localhost:3001`

## Contributing

Feel free to open issues, submit pull requests, and suggest improvements. Contributions are welcome!

## License

This project is licensed under the MIT License.

