# Config Server

Centralized Spring Cloud Config server for Event Hub. This service loads configuration from the `config-repo` Git repository and serves environment-specific properties to the backend services.

## Stack

- Java 17
- Spring Boot 3
- Spring Cloud Config Server
- Eureka client

## Responsibilities

- Serve shared configuration to backend services
- Pull configuration from Git on startup
- Support branch selection through `CONFIG_GIT_LABEL`
- Register with Eureka
- Expose Actuator health and env endpoints

## Non-Functional Requirements

- Central source of truth for backend configuration
- Git-backed versioned config
- Startup pull from config repository
- Health visibility through Actuator

## Common Endpoints

Spring Cloud Config standard endpoints include:

- `GET /{application}/{profile}`
- `GET /{application}/{profile}/{label}`

Examples:

- `/auth-service-api/local`
- `/event-service-api/prod`

## Runtime Dependencies

- Eureka Server
- Local or remote config Git repository

## Local Setup

Required properties are already wired in `application.properties`.

Key values:

- `CONFIG_GIT_URI`
- `CONFIG_GIT_LABEL`
- `CONFIG_GIT_USERNAME`
- `CONFIG_GIT_PASSWORD`
- `EUREKA_DEFAULT_ZONE`

Run:

```powershell
.\mvnw.cmd spring-boot:run
```

Default port: `8888`

## Build

```powershell
.\mvnw.cmd clean package
```
