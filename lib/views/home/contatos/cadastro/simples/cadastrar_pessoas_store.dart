import 'package:mobx/mobx.dart';
import 'package:romaniz/model/bairro.dart';
import 'package:romaniz/model/cidade.dart';

part 'cadastrar_pessoas_store.g.dart';

class CadastrarPessoasStore = CadastrarPessoasStoreBase with _$CadastrarPessoasStore;

abstract class CadastrarPessoasStoreBase with Store {
  // observables
  @observable
  ObservableList<Cidade> _cidades = ObservableList();
  @observable
  ObservableList<Bairro> _bairros = ObservableList();
  @observable
  Cidade? _cidadeSelecionada;
  @observable
  Bairro? _bairroSelecionado;

  // reactions
  List<Cidade> get cidades => _cidades;
  List<Bairro> get bairros => _bairros;
  Cidade? get cidadeSelecionada => _cidadeSelecionada;
  Bairro? get bairroSelecionado => _bairroSelecionado;

  // actions
  @action
  void setCidades(List<Cidade> cidades) => _cidades = ObservableList.of(cidades);
  @action
  void setBairros(List<Bairro> bairros) => _bairros = ObservableList.of(bairros);
  @action
  void updateCidadeSelecionada(Cidade? cidade) => _cidadeSelecionada = cidade;
}
