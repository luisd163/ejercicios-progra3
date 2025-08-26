defmodule Util do
  @moduledoc """
  Módulo con funciones que se reutilizan
  - autor: Luis Daniel Gómez.
  - fecha: 2025-08-19
  - licencia: GNU GPL v3
  """

  @doc """
  Muestra un mensaje en una ventana emergente.
  # Parámetro
  - mensaje: El mensaje a mostrar.
  # Ejemplo
  iex> Util.mostrar_mensaje("¡Hola Mundo!")

  o puede usar

  "Hola Mundo"
  |> Util.mostrar_mensaje()
  """
  def mostrar_mensaje(mensaje) do
    mensaje
    |> IO.puts()
  end

  @doc """
  Permite ingresar un valor:
  - :texto  → devuelve un string
  - :entero → devuelve un entero
  - :real   → devuelve un número real
  """
  def ingresar(mensaje, tipo)

  def ingresar(mensaje, :texto) do
    mensaje
    |> IO.gets()
    |> String.trim()
  end

  def ingresar(mensaje, :real), do: ingresar(mensaje, &String.to_float/1, :real)

  def ingresar(mensaje, :entero), do: ingresar(mensaje, &String.to_integer/1, :entero)

  defp ingresar(mensaje, parser, tipo_dato) do
    try do
      mensaje
      |> ingresar(:texto)
      |> parser.()
    rescue
      ArgumentError ->
        "Error, se espera que ingrese un número #{tipo_dato}\n"
        |> mostrar_error()

        mensaje
        |> ingresar(parser, tipo_dato)
    end
  end

  def mostrar_error(mensaje) do
    mensaje
    |> IO.puts(:standard_error)
  end
end
