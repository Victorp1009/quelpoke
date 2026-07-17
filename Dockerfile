# Étape 1 : Compilation (Builder)
FROM golang:1.21-alpine AS builder
WORKDIR /app
# Copie des fichiers sources
COPY . .
# Compilation de l'exécutable
RUN go build -o quelpoke main.go

# Étape 2 : Création de l'image finale (Légère)
FROM alpine:latest
WORKDIR /root/
# On récupère uniquement le binaire compilé de l'étape précédente
COPY --from=builder /app/quelpoke .
# On expose le port 8080
EXPOSE 8080
# Commande de démarrage
CMD ["./quelpoke"]
