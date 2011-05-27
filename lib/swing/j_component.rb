require 'swing'

class Swing::JComponent

  #    actionMap                  ActionMap • •
  #    alignmentX                 float • •
  #    alignmentY                 float • •
  #    autoscrolls                boolean • • false
  #    border                     Border • • null
  #    bounds                     Rectangle • •
  #    debugGraphicsOptions       int • • DebugGraphics.NONE_OPTION
  #    doubleBuffered             boolean • • false
  #    enabled                    boolean • • true   - OVERRIDE
  #    location                   Point • • Point(bounds.x, bounds.y) - OVERRIDE
  #    maximumSize                Dimension • •
  #    minimumSize                Dimension • •
  #    nextFocusableComponent     Component • •
  #    opaque                     boolean • • false
  #    preferredSize              Dimension • •
  #    requestFocusEnabled        boolean • • true
  #    size                       Dimension • • Dimension(bounds.height, bounds.width)
  #    toolTipText                String • • null         - OVERRIDE
  #    transferHandler            TransferHandler • • null
  #    verifyInputWhenFocusTarget boolean • •
  #    visible                    boolean • • true        - OVERRIDE
  #    ----Getters only - NO Setters!
  #    UI                         ComponentUI •
  #    UIClassID                  String • "ComponentUI"
  #    accessibleContext          AccessibleContext • null
  #    ancestorListeners          AncestorListener[] •
  #    focusCycleRoot             boolean • false
  #    focusTraversable           boolean • true
  #    graphics                   Graphics •
  #    height                     int • bounds.height
  #    managingFocus              boolean • false
  #    optimizedDrawingEnabled    boolean • true
  #    paintingTile               boolean •
  #    propertyChangeListeners (also string indexed version) PropertyChangeListener[] •
  #    registeredKeyStrokes       KeyStroke[] •
  #    rootPane                   JRootPane •
  #    topLevelAncestor           Container •
  #    validateRoot               boolean • false
  #    vetoableChangeListeners    VetoableChangeListener[]
  #    visibleRect                Rectangle •
  #    width                      int • bounds.width
  #    x                          int • bounds.x
  #    y                          int • bounds.y
  #    ----Wrong - NOT Working Setters!
  #    defaultLocales             Locale • •    - no setter/getter at all
  #    inputMap (also indexed get)InputMap • • - setter not working properly ?!
  #    inputVerifier              InputVerifier • • - setter raises exception
  #    insets                     Insets • • - insets are reset anyways

  attr_setter :action_map, :alignmentx, :alignmenty, :autoscrolls, :border, :bounds,
              :debug_graphics_options, :double_buffered, :input_map, # :default_locales,
              :input_verifier, :insets,
              :opaque, :next_focusable_component, :request_focus_enabled,
              :tool_tip_text, :verify_input_when_focus_target,
              :minimum_size => Awt::Dimension, :maximum_size => Awt::Dimension,
              :preferred_size => Awt::Dimension, :transfer_handler => Swing::TransferHandler
end
