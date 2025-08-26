defmodule EntradaDatos do
  def main do
    valor_producto = "Ingrese el valor del producto: "
    |> Util.ingresar(:entero)

    porcentaje_descuento = "ingrese el porcentaje(0.0 - 1.0) de descuento: "
    |> Util.ingresar(:real)

    valor_total = calcular_descuento(valor_producto, porcentaje_descuento)

    generar_mensaje(valor_total)
    |> Util.mostrar_mensaje()

  end

  defp generar_mensaje(valor_total) do
    "El valor total con descuento es $ #{valor_total}"
  end

  defp calcular_descuento(valor_producto, porcentaje_descuento) do
    descuento = valor_producto * porcentaje_descuento
    valor_producto - descuento
  end

end

EntradaDatos.main()
