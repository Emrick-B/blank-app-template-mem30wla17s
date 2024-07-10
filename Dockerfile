# Utiliser une image de base officielle OpenJDK pour construire l'application
FROM maven:3.8-openjdk-17 as build

# Définir le répertoire de travail
WORKDIR /app

# Copier le fichier pom.xml et le répertoire src dans le conteneur
COPY pom.xml ./
COPY src ./src/

# Construire l'application avec Maven
RUN mvn clean package -DskipTests

# Utiliser une image de base officielle OpenJDK pour exécuter l'application
FROM openjdk:17-jdk-slim

# Définir le répertoire de travail
WORKDIR /app

# Copier le fichier jar de l'application dans le conteneur
COPY --from=build /app/target/*.jar ./team-event-manager.jar

# Définir la commande pour démarrer l'application
CMD ["java", "-jar", "team-event-manager.jar"]
