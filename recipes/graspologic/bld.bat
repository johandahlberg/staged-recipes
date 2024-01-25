echo "Install graspologic-native"
pushd graspologic-native

  pushd ./packages/pyo3/
    maturin build --release -i $PYTHON
  popd

  echo "Install graspologic native wheel"
  %PYTHON% -m pip install -vv --no-deps --no-build-isolation target/wheels/graspologic_native-*.whl
popd

echo "Install graspologic"
pushd graspologic
  %PYTHON% -m pip install . -vv --no-deps --no-build-isolation
popd