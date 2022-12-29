// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cadastrar_contato_simples_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CadastrarContatoSimplesStore
    on CadastrarContatoSimplesStoreBase, Store {
  late final _$_cidadesAtom =
      Atom(name: 'CadastrarContatoSimplesStoreBase._cidades', context: context);

  @override
  ObservableList<Cidade> get _cidades {
    _$_cidadesAtom.reportRead();
    return super._cidades;
  }

  @override
  set _cidades(ObservableList<Cidade> value) {
    _$_cidadesAtom.reportWrite(value, super._cidades, () {
      super._cidades = value;
    });
  }

  late final _$_bairrosAtom =
      Atom(name: 'CadastrarContatoSimplesStoreBase._bairros', context: context);

  @override
  ObservableList<Bairro> get _bairros {
    _$_bairrosAtom.reportRead();
    return super._bairros;
  }

  @override
  set _bairros(ObservableList<Bairro> value) {
    _$_bairrosAtom.reportWrite(value, super._bairros, () {
      super._bairros = value;
    });
  }

  late final _$_cidadeSelecionadaAtom = Atom(
      name: 'CadastrarContatoSimplesStoreBase._cidadeSelecionada',
      context: context);

  @override
  Cidade? get _cidadeSelecionada {
    _$_cidadeSelecionadaAtom.reportRead();
    return super._cidadeSelecionada;
  }

  @override
  set _cidadeSelecionada(Cidade? value) {
    _$_cidadeSelecionadaAtom.reportWrite(value, super._cidadeSelecionada, () {
      super._cidadeSelecionada = value;
    });
  }

  late final _$_bairroSelecionadoAtom = Atom(
      name: 'CadastrarContatoSimplesStoreBase._bairroSelecionado',
      context: context);

  @override
  Bairro? get _bairroSelecionado {
    _$_bairroSelecionadoAtom.reportRead();
    return super._bairroSelecionado;
  }

  @override
  set _bairroSelecionado(Bairro? value) {
    _$_bairroSelecionadoAtom.reportWrite(value, super._bairroSelecionado, () {
      super._bairroSelecionado = value;
    });
  }

  late final _$CadastrarContatoSimplesStoreBaseActionController =
      ActionController(
          name: 'CadastrarContatoSimplesStoreBase', context: context);

  @override
  void setCidades(List<Cidade> cidades) {
    final _$actionInfo = _$CadastrarContatoSimplesStoreBaseActionController
        .startAction(name: 'CadastrarContatoSimplesStoreBase.setCidades');
    try {
      return super.setCidades(cidades);
    } finally {
      _$CadastrarContatoSimplesStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setBairros(List<Bairro> bairros) {
    final _$actionInfo = _$CadastrarContatoSimplesStoreBaseActionController
        .startAction(name: 'CadastrarContatoSimplesStoreBase.setBairros');
    try {
      return super.setBairros(bairros);
    } finally {
      _$CadastrarContatoSimplesStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void updateCidadeSelecionada(Cidade? cidade) {
    final _$actionInfo =
        _$CadastrarContatoSimplesStoreBaseActionController.startAction(
            name: 'CadastrarContatoSimplesStoreBase.updateCidadeSelecionada');
    try {
      return super.updateCidadeSelecionada(cidade);
    } finally {
      _$CadastrarContatoSimplesStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
