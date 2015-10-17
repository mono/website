---
title: "GtkSharp: Contêiner Fixed"
redirect_from:
  - /GtkSharp:_Fixed_Container/
---

O contêiner Fixed permite que você insira widgets em uma posição fixa dentro de sua janela, em relação ao canto superior esquerdo. A posição do widget pode ser modificada dinamicamente. Existem apenas algumas funções associadas com o widget Fixed:

    Fixed fixed1 = new Fixed();
    fixed1.Put(widget, x, y);
    fixed1.Move(widget, x, y);

Put() coloca um widget no contêiner Fixed em uma posição especificada por x e y. Move() permite ao widget especificado ser movido para uma nova posição.

Normalmente, widgets Fixed não têm sua própria janela. Uma vez que este é um comportamento diferente do comportamento dos widgets Fixed em versões anteriores do GTK, a propriedade HasWindow permite a criação de widgets Fixed com sua própria janela. Essa propriedade tem que ser inicializada antes de 'realizar' o widget.

