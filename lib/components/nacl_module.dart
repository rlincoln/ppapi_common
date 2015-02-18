library ppapi_common.components.nacl_module;

import 'dart:html';
import 'dart:async';

import 'package:polymer/polymer.dart';

import '../nacl_module.dart';

class PolymerNaClModule extends AsyncNaClModule { 
  PolymerNaClModule(wrapper, name, path) : super(wrapper, name, path);
}

@CustomTag('nacl-module')
class NaClModuleElement extends PolymerElement with Observable {
  @published String name;
  @published String path;
  @published num width, height;
  
  DivElement _listener;
  PolymerNaClModule _module;

  NaClModuleElement.created() : super.created();

  void ready() {
    Polymer.onReady.then((_) {
      return _polymerReady();
    });
  }

  Future _polymerReady() {
    _listener = this.$['listener'] as DivElement;
    _module = new PolymerNaClModule(_listener, name, path)
      ..width = width
      ..height = height;
    return _module.loadModule();
  }
}