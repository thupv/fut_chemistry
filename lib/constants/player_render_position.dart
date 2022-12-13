enum RenderPosition {
  stCenter,
  stLeft,
  stRight,
  lw,
  rw,
  cfLeft,
  cfRight,
  cfCenter,

  camCenter,
  camLeft,
  camRight,
  lm,
  rm,
  lcm,
  rcm,
  cmCenter,
  cmCLeft,
  cmCRight,
  rb,
  lb,
  rwb,
  lwb,
  cdm,
  lcb,
  rcb,
  cbCenter,
  cbCLeft,
  cbCRight,
  gk
}
class PlayerRenderPosition {
  static Map<RenderPosition, List<double>> renderPositionMap = {
    RenderPosition.stCenter: [0.5, 0.1],
    RenderPosition.stLeft: [0.3, 0.1],
    RenderPosition.stRight: [0.7, 0.1],

    RenderPosition.cfLeft: [0.3, 0.15],
    RenderPosition.cfRight: [0.7, 0.15],
    RenderPosition.cfCenter: [0.5, 0.15],

    RenderPosition.lw: [0.17, 0.15],
    RenderPosition.rw: [0.83, 0.15],

    RenderPosition.camCenter: [0.5, 0.25],
    RenderPosition.camLeft: [0.3, 0.25],
    RenderPosition.camRight: [0.7, 0.25],

    RenderPosition.lm: [0.12, 0.4],
    RenderPosition.rm: [0.88, 0.4],
    RenderPosition.lcm: [0.37, 0.4],
    RenderPosition.rcm: [0.63, 0.4],
    RenderPosition.cmCenter: [0.5, 0.4],
    RenderPosition.cmCLeft: [0.2, 0.4],
    RenderPosition.cmCRight: [0.8, 0.4],
    RenderPosition.cdm: [0.5, 0.55],

    RenderPosition.lb: [0.12, 0.65],
    RenderPosition.rb: [0.88, 0.65],

    RenderPosition.lwb: [0.12, 0.6],
    RenderPosition.rwb: [0.88, 0.6],

    RenderPosition.lcb: [0.37, 0.7],
    RenderPosition.rcb: [0.63, 0.7],

    RenderPosition.cbCLeft: [0.2, 0.7],
    RenderPosition.cbCRight: [0.8, 0.7],
    RenderPosition.cbCenter: [0.5, 0.7],

    RenderPosition.gk: [0.5, 0.9]
  };
  static List<double> getRenderPosition(RenderPosition position) {
    return renderPositionMap[position]!;
  }
}