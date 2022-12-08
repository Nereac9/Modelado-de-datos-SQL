select a.id_coche, b.modelo, c.marca, d.grupo, a.fecha_compra, a.num_matricula, e.color, a.num_km , f.aseguradora, a.num_poliza 
from practica_ncr.coches a, practica_ncr.modelos b, practica_ncr.marcas c, practica_ncr.grupos d, practica_ncr.colores e , practica_ncr.aseguradoras f
where b.id_modelo = a.id_modelo and b.id_marca = c.id_marca and c.id_grupo = d.id_grupo  and a.id_color = e.id_color and a.id_aseguradora = f.id_aseguradora 
