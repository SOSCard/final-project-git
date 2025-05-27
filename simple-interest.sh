#!/bin/bash

# Script para calcular interés simple
# Fórmula: Interés Simple = (Principal * Tasa * Tiempo) / 100

echo "==================================="
echo "   CALCULADORA DE INTERÉS SIMPLE"
echo "==================================="
echo

# Solicitar datos al usuario
read -p "Ingresa el monto principal: " principal
read -p "Ingresa la tasa de interés anual (%): " tasa
read -p "Ingresa el tiempo en años: " tiempo

# Validar que los valores sean números
if ! [[ "$principal" =~ ^[0-9]+([.][0-9]+)?$ ]] || ! [[ "$tasa" =~ ^[0-9]+([.][0-9]+)?$ ]] || ! [[ "$tiempo" =~ ^[0-9]+([.][0-9]+)?$ ]]; then
    echo "Error: Por favor ingresa valores numéricos válidos."
    exit 1
fi

# Calcular interés simple
interes=$(echo "scale=2; ($principal * $tasa * $tiempo) / 100" | bc -l)
monto_total=$(echo "scale=2; $principal + $interes" | bc -l)

# Mostrar resultados
echo
echo "==================================="
echo "           RESULTADOS"
echo "==================================="
echo "Monto Principal: $${principal}"
echo "Tasa de Interés: ${tasa}%"
echo "Tiempo: ${tiempo} años"
echo "Interés Simple: $${interes}"
echo "Monto Total: $${monto_total}"
echo "==================================="
