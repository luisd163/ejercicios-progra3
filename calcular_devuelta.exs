defmodule EntradaEnteros do
  def main do
    valor_total =
      "Ingrese valor total de la factura: "
      |> Util.ingresar(:entero)

    valor_entregado =
      "Ingrese valor entregado para el pago: "
      |> Util.ingresar(:entero)

    devuelta = calcular_devuelta(valor_total, valor_entregado)

    generar_mensaje(devuelta)
    |> Util.mostrar_mensaje()
  end

  defp generar_mensaje(devuelta) do
    "El valor a devolver es  $ #{devuelta}"
  end

  defp calcular_devuelta(valor_total, valor_entregado) do
    valor_entregado - valor_total
  end
end

EntradaEnteros.main()
