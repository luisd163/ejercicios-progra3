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
  Permite ingresar texto
  # Parámetro
  -mensaje para el usuario
  # Ejemplo
  "Ingrese su nombre"
  |> Util.ingresar(:texto)
  """
  def ingresar(mensaje, :texto) do
    mensaje
    |> IO.gets()
    |> String.trim()
  end

  @doc """
  Permite ingresar un entero
  # Parámetro
  -mensaje para el usuario
  # Ejemplo
  "Ingrese su edad"
  |> Util.ingresar(:entero)
  """
  def ingresar(mensaje, :entero) do
    try do
      mensaje
      |> ingresar(:texto)
      |> String.to_integer()
    rescue
      ArgumentError ->
        "Error, se espera que se ingrese un numero entero\n"
        |> mostrar_error()

        mensaje
        |> ingresar(:entero)
    end
  end

  @doc """
  Permite ingresar un entero
  # Parámetro
  -mensaje para el usuario
  # Ejemplo
  "Ingrese su edad"
  |> Util.ingresar(:entero)
  """
  def ingresar(mensaje, :real) do
    try do
      mensaje
      |> ingresar(:texto)
      |> String.to_float()
    rescue
      ArgumentError ->
        "Error, se espera que se ingrese un numero real"
        |> mostrar_error()

        mensaje
        |> ingresar(:real)
    end
  end

  def mostrar_error(mensaje) do
    mensaje
    |> IO.puts(:standard_error)
  end
end
