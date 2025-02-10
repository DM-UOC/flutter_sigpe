abstract class IGetPersistencia<T, O> {
  Future<T> retornaPorId(O objeto);
  Future<List<T>> retornar();
  Future<List<T>> retornarPorId(O objeto);
}
