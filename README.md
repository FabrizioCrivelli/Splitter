# proyectoGrupo5
Repositorio del grupo 5 de proyecto final, taller de programación 3 y calidad de software

# Proyecto: Lista de Compras Compartida con Gastos y Agente IA


# Lista de Compras Compartida + Gastos (tipo Splitwise) con Agente IA para Organización de Juntadas

# Descripción de la idea
La aplicación busca resolver un problema común en reuniones sociales: organizar quién compra qué, evitar compras duplicadas y dividir gastos de manera justa. Los usuarios podrán crear un evento, compartir una lista de compras con los participantes, asignar ítems, registrar gastos y calcular automáticamente quién debe pagar a quién. Como diferencial innovador, se integrará un agente de IA que, a partir de los datos del evento (cantidad de personas, restricciones alimentarias, presupuesto), generará automáticamente una propuesta de lista de compras con cantidades sugeridas.
Alcance general
Organización colaborativa de eventos con listas de compras compartidas.
División de gastos automática y justa, similar a Splitwise.
Agente IA que propone listas de compras según contexto, restricciones y presupuesto.
Experiencia sencilla y accesible.

# Funcionalidades principales:
Autenticación: email/contraseña o invitado local; recuperación de contraseña.
Eventos: crear un evento (fecha, nombre, ubicación opcional), invitar participantes por link/código/QR.
Lista de compras:
CRUD de ítems (nombre, categoría, cantidad, unidad, precio estimado opcional).
Asignación de ítems a personas (“me lo pido yo” / asignar a otro).
Estados: pendiente / en progreso / comprado; check rápido.
Comentarios/notas por ítem (ej.: “marca X”, “sin azúcar”).
Gastos y saldos (estilo Splitwise):
Registrar gastos (quién pagó, monto, moneda, a qué corresponde, foto del ticket opcional).
División: equitativa por defecto; opciones por porcentaje, monto fijo o exclusiones (ej.: quien no consume alcohol).
Cálculo de saldos: mostrar “le debés a…” con minimización de pagos (simplificación de deudas).
Exportar resumen del evento (PDF/CSV) con detalle de gastos y saldos.
Sincronización y offline:
Funciona sin internet (DB local). Cambios se sincronizan cuando vuelve la conexión.
Notificaciones:
Recordatorios previos al evento; cambios en asignaciones; “queda 1 día para comprar”.

# Fuera de alcance MVP (para siguientes iteraciones):
Agente IA (v1):
Input en lenguaje natural: “asado para 12, 3 no comen carne, 2 celíacos, $120.000 máx.”
Output: lista propuesta (cortes/alternativas veganas, bebidas, acompañamientos, descartables) con cantidades por persona, costo estimado y opciones (económica/estándar/premium).
Permite aceptar y convertir en lista editable.


# Exclusiones
Para mantener el alcance controlado y viable, se definen explícitamente las funcionalidades que no se incluirán en este proyecto:
Integraciones con medios de pago (ej.: MercadoPago, PayPal, bancos).
Soporte multilenguaje (solo español en MVP y siguientes versiones inmediatas).
Integraciones con apps de mensajería externas (WhatsApp, Telegram, Signal, etc.).
Funcionalidad de chat interno entre participantes (solo comentarios/notas en ítems).
Integraciones con supermercados o plataformas de e-commerce para compra automática o comparación de precios.
Reconocimiento OCR avanzado para tickets de compra (solo carga manual o foto adjunta básica).
Soporte de múltiples monedas dentro de un mismo evento (solo una moneda por evento en MVP).
Reconocimiento de voz para crear ítems o gastos dictados.
Exportaciones avanzadas en formatos especiales (solo PDF/CSV básicos).
Integración con asistentes virtuales externos (Alexa, Google Assistant, Siri).
Control de inventario doméstico (ej.: saber lo que tenés en tu casa y restarlo automáticamente).
Algoritmos complejos de recomendación de marcas/productos (solo sugerencias básicas por IA).


# Valor diferencial
El proyecto combina dos aspectos prácticos y conocidos (lista colaborativa y división de gastos) con un agregado innovador: el uso de IA para simplificar la planificación. Esto no solo muestra un desarrollo mobile completo en Flutter + Dart, sino también la integración de servicios de inteligencia artificial, lo que lo hace atractivo y con proyección real de uso.


