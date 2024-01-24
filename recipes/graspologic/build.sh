echo "Install graspologic-native"
pushd graspologic-native

  # TODO Do we need to check which architecture we are targetting here
  # and build the correct wheel accordingly?
  # And do we need to add a build.bat for building on windows as well?
  pushd ./packages/pyo3/
    maturin build --release -i $PYTHON
  popd

  echo "Install graspologic native wheel"
  $PYTHON -m pip install -vv --no-deps --no-build-isolation target/wheels/graspologic_native-*.whl
popd

echo "Install graspologic"
pushd graspologic
  $PYTHON -m pip install . -vv --no-deps --no-build-isolation
popd