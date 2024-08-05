{
4.- Una librería requiere el procesamiento de la información de sus productos. De cada
producto se conoce el código del producto, código de rubro (del 1 al 8) y precio.
Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:
a. Lea los datos de los productos y los almacene ordenados por código de producto y
agrupados por rubro, en una estructura de datos adecuada. El ingreso de los productos finaliza
cuando se lee el precio 0.
b. Una vez almacenados, muestre los códigos de los productos pertenecientes a cada rubro.
c. Genere un vector (de a lo sumo 30 elementos) con los productos del rubro 3. Considerar que
puede haber más o menos de 30 productos del rubro 3. Si la cantidad de productos del rubro 3
es mayor a 30, almacenar los primeros 30 que están en la lista e ignore el resto.
d. Ordene, por precio, los elementos del vector generado en c) utilizando alguno de los dos
métodos vistos en la teoría.
e. Muestre los precios del vector resultante del punto d).
f. Calcule el promedio de los precios del vector resultante del punto d)
}

program ej1;

const
    maxRubro = 8;
    maxArray = 30;
    rubroAnalizar = 3;

type
    rubros = 1..maxRubro;

    producto = record
        codigo: integer;
        rubro: rubros;
        precio: real;
    end;

    lista = ^nodo;

    nodo = record
        prod : producto;
        sig : lista;
    end;

    productos = array [rubros] of lista;

    vectorR3 = array [1..maxArray] of producto;

//modulos

    procedure insertarOrdenado(var pI : lista; p : producto);
    var
        act, ant, nue : lista;
    begin
        new(nue);
        nue^.prod := p;
        act := pI;
        ant := act;
        while (act <> nil) and (act^.prod.codigo < p.codigo) do begin
            ant := act;
            act := act^.sig;
        end;
        if (act = ant) then 
            pI := nue
        else
            ant^.sig := nue;
        nue^.sig := act;
    end;

    procedure inicializarVector (var vec : productos);   
    var
        i : integer;
    begin
        for i := 1 to maxRubro do begin
            vec[i] := nil;
        end;
    end;

    procedure leerProducto(var p: producto);
    begin
        write('ingrese el precio del producto: ');
        readln(p.precio);
        if (p.precio <> 0) then begin
            write('ingrese el codigo: ');
            read(p.codigo);
            write('ingrese el rubro: ');
            read(p.rubro);
        end;
    end;

    procedure cargarProductos (var vectorProd : productos);
    var
        p : producto;
    begin
        leerProducto(p);
        while (p.precio <> 0) do begin
            insertarOrdenado(vectorProd[p.rubro], p);
            leerProducto(p);
        end;
    end;

    procedure mostrarCodigos(vectorProd : productos);
    var
        i : integer;
        act : lista;
    begin
        for i := 1 to maxRubro do begin
            writeln('codigos del rubro: ', i);
            act := vectorProd[i];
            while (act <> nil) do begin
                writeln('producto: ',act^.prod.codigo);
                act := act^.sig;
            end;
        end;
    end;

    procedure generarVectorR3(vectorProd : productos; var vecR3 : vectorR3; var diml : integer);
    var
        act : lista;
    begin
        diml := 0;
        act := vectorProd[rubroAnalizar];
        while (act <> nil) and (diml < maxArray) do begin
            diml := diml + 1;
            vecR3[diml] := act^.prod;
            act := act^.sig;
        end;
    end;
    
    procedure ordenarVecR3(var vecR3 : vectorR3; diml : integer);
    var 
        i, j, pos: integer; 
        item : producto;	
    begin
        for i := 1 to diml - 1 do begin 
            pos := i;
            for j := i + 1 to diml do begin
                if vecR3[j].precio < vecR3[pos].precio then 
                    pos :=  j;
            end;
            item := vecR3[pos];  
            vecR3[pos] := vecR3[i];   
            vecR3[i] := item;
        end;
    end;
        
    procedure preciosVecR3(vecR3 : vectorR3; diml : integer);
    var
        i : integer;
        total : real;
    begin
        total := 0;
        for i := 1 to diml do begin
            writeln('precio del producto ',vecR3[i].codigo,' es: ',vecR3[i].precio:0:2);
            total := total + vecR3[i].precio;
        end;
        writeln('Promedio de precios: ', (total / diml):0:2);
    end;

//programa principal

var 
    vectorProductos : productos;
    vecR3 : vectorR3;
    diml : integer;

begin
    inicializarVector(vectorProductos);
    cargarProductos(vectorProductos);
    mostrarCodigos(vectorProductos);
    generarVectorR3(vectorProductos, vecR3, diml);
    ordenarVecR3(vecR3, diml);
    preciosVecR3(vecR3, diml);
end.
