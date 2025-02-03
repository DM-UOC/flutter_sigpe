abstract class IPostPersistencia<O, R> {
  Future<R> post(String recurso, O object);
}
