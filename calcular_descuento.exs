defmodule EntradaDatos do
  def main do
    valor_producto = "Ingrese el valor del producto: "
    |> Util.ingresar(:entero)

    porcentaje_descuento = "ingrese el porcentaje(0.0 - 1.0) de descuento: "
    |> Util.ingresar(:real)

    descuento = calcular_descuento(valor_producto, porcentaje_descuento)

    valor_total = calcular_valor_final(valor_producto, descuento)

    generar_mensaje(valor_total)
    |> Util.mostrar_mensaje()

  end

  defp generar_mensaje(valor_total) do
    "El valor total con descuento es $ #{valor_total}"
  end

  defp calcular_descuento(valor_producto, porcentaje_descuento) do
    valor_producto * porcentaje_descuento
  end

  defp calcular_valor_final(valor_producto, descuento) do
    valor_producto - descuento
  end

end

EntradaDatos.main()
