---
title: "GtkSharp: Fixed Container"
redirect_from:
  - /GtkSharp:_Fixed_Container/
---

O recipiente fixo permite que você insira widgets em uma posição fixa dentro de sua janela, em relação ao canto superior esquerdo. A posição do widget pode ser modificada dinamicamente. Existem apenas algumas funções associadas com o widget fixo:

    Fixed fixed1 = new Fixed();
    fixed1.Put(widget, x, y);
    fixed1.Move(widget, x, y);

Put() coloca um widget no recipeiente fixo em uma posição especificada por x e y. Move() permite ao widget especificado ser movido para uma nova posição.

Normalmente, widgets fixos não tem sua própria janela. Uma vez que este é diferente do comportamento dos widgets fixos em versões anteriores do GTK, a propriedade HasWindow permite a criação de widgets fixos com sua própria janela. Ela tem que ser chamada antes de iniciar o widget.

