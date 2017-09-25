@[Link("tensor")]
lib LibTensorFlow
  # Enums
  enum Code
    Ok                 =  0
    Cancelled          =  1
    Unknown            =  2
    InvalidArgument    =  3
    DeadlineExceeded   =  4
    NotFound           =  5
    AlreadyExists      =  6
    PermissionDenied   =  7
    Unauthenticated    = 16
    ResourceExhausted  =  8
    FailedPrecondition =  9
    Aborted            = 10
    OutOfRange         = 11
    Unimplemented      = 12
    Internal           = 13
    Unavailable        = 14
    DataLoss           = 15
  end

  enum DataType
    Float      =  1
    Double     =  2
    Int32      =  3
    Uint8      =  4
    Int16      =  5
    Int8       =  6
    String     =  7
    Complex64  =  8
    Complex    =  8
    Int64      =  9
    Bool       = 10
    Qint8      = 11
    Quint8     = 12
    Qint32     = 13
    Bfloat16   = 14
    Qint16     = 15
    Quint16    = 16
    Uint16     = 17
    Complex128 = 18
    Half       = 19
    Resource   = 20
  end

  enum AttrType
    AttrString      = 0
    AttrInt         = 1
    AttrFloat       = 2
    AttrBool        = 3
    AttrType        = 4
    AttrShape       = 5
    AttrTensor      = 6
    AttrPlaceholder = 7
    AttrFunc        = 8
  end

  # Structs
  struct AttrMetadata
    is_list : UInt8
    list_size : Int64T
    type : AttrType
    total_size : Int64T
  end

  struct Buffer
    data : Void*
    length : LibC::Int
    data_deallocator : (Void*, LibC::Int -> Void)
  end

  struct Input
    oper : Operation
    index : LibC::Int
  end

  type Operation = Void*

  struct Output
    oper : Operation
    index : LibC::Int
  end

  struct WhileParams
    ninputs : LibC::Int
    cond_graph : Graph
    cond_inputs : Output*
    cond_output : Output
    body_graph : Graph
    body_inputs : Output*
    body_outputs : Output*
    name : LibC::Char*
  end

  # Aliases
  alias Status = Void
  alias X__Int64T = LibC::Long
  alias Int64T = X__Int64T
  alias Tensor = Void
  alias OperationDescription = Void
  alias Operation = Void
  alias SessionOptions = Void
  alias ImportGraphDefOptions = Void
  alias Graph = Void
  alias Session = Void
  alias Library = Void
  alias DeviceList = Void
  alias DeprecatedSession = Void

  # Types
  type Status = Void*
  type Tensor = Void*
  type SessionOptions = Void*
  type Graph = Void*
  type OperationDescription = Void*
  type ImportGraphDefOptions = Void*
  type Session = Void*
  type DeprecatedSession = Void*
  type DeviceList = Void*
  type Library = Void*

  # Functions

  fun version = TF_Version : LibC::Char*
  fun data_type_size = TF_DataTypeSize : LibC::Int
  fun new_status = TF_NewStatus : Status
  fun delete_status = TF_DeleteStatus(x0 : Status)
  fun set_status = TF_SetStatus(s : Status, code : Code, msg : LibC::Char*)
  fun get_code = TF_GetCode(s : Status) : Code
  fun message = TF_Message(s : Status) : LibC::Char*
  fun new_buffer_from_string = TF_NewBufferFromString(proto : Void*, proto_len : LibC::Int) : Buffer*
  fun new_buffer = TF_NewBuffer : Buffer*
  fun delete_buffer = TF_DeleteBuffer(x0 : Buffer*)
  fun get_buffer = TF_GetBuffer(buffer : Buffer*) : Buffer
  fun new_tensor = TF_NewTensor(x0 : DataType, dims : Int64T*, num_dims : LibC::Int, data : Void*, len : LibC::Int, deallocator : (Void*, LibC::Int, Void* -> Void), deallocator_arg : Void*) : Tensor
  fun allocate_tensor = TF_AllocateTensor(x0 : DataType, dims : Int64T*, num_dims : LibC::Int, len : LibC::Int) : Tensor
  fun tensor_maybe_move = TF_TensorMaybeMove(tensor : Tensor) : Tensor
  fun delete_tensor = TF_DeleteTensor(x0 : Tensor)
  fun tensor_type = TF_TensorType(x0 : Tensor) : DataType
  fun num_dims = TF_NumDims(x0 : Tensor) : LibC::Int
  fun dim = TF_Dim(tensor : Tensor, dim_index : LibC::Int) : Int64T
  fun tensor_byte_size = TF_TensorByteSize : LibC::Int
  fun tensor_data = TF_TensorData(x0 : Tensor) : Void*
  fun string_encode = TF_StringEncode : LibC::Int
  fun string_decode = TF_StringDecode : LibC::Int
  fun string_encoded_size = TF_StringEncodedSize : LibC::Int
  fun new_session_options = TF_NewSessionOptions : SessionOptions
  fun set_target = TF_SetTarget(options : SessionOptions, target : LibC::Char*)
  fun set_config = TF_SetConfig(options : SessionOptions, proto : Void*, proto_len : LibC::Int, status : Status)
  fun delete_session_options = TF_DeleteSessionOptions(x0 : SessionOptions)
  fun new_graph = TF_NewGraph : Graph
  fun delete_graph = TF_DeleteGraph(x0 : Graph)
  fun graph_set_tensor_shape = TF_GraphSetTensorShape(graph : Graph, output : Output, dims : Int64T*, num_dims : LibC::Int, status : Status)
  fun graph_get_tensor_num_dims = TF_GraphGetTensorNumDims(graph : Graph, output : Output, status : Status) : LibC::Int
  fun graph_get_tensor_shape = TF_GraphGetTensorShape(graph : Graph, output : Output, dims : Int64T*, num_dims : LibC::Int, status : Status)
  fun new_operation = TF_NewOperation(graph : Graph, op_type : LibC::Char*, oper_name : LibC::Char*) : OperationDescription
  fun set_device = TF_SetDevice(desc : OperationDescription, device : LibC::Char*)
  fun add_input = TF_AddInput(desc : OperationDescription, input : Output)
  fun add_input_list = TF_AddInputList(desc : OperationDescription, inputs : Output*, num_inputs : LibC::Int)
  fun add_control_input = TF_AddControlInput(desc : OperationDescription, input : Operation)
  fun colocate_with = TF_ColocateWith(desc : OperationDescription, op : Operation)
  fun set_attr_string = TF_SetAttrString(desc : OperationDescription, attr_name : LibC::Char*, value : Void*, length : LibC::Int)
  fun set_attr_string_list = TF_SetAttrStringList(desc : OperationDescription, attr_name : LibC::Char*, values : Void**, lengths : LibC::Int*, num_values : LibC::Int)
  fun set_attr_int = TF_SetAttrInt(desc : OperationDescription, attr_name : LibC::Char*, value : Int64T)
  fun set_attr_int_list = TF_SetAttrIntList(desc : OperationDescription, attr_name : LibC::Char*, values : Int64T*, num_values : LibC::Int)
  fun set_attr_float = TF_SetAttrFloat(desc : OperationDescription, attr_name : LibC::Char*, value : LibC::Float)
  fun set_attr_float_list = TF_SetAttrFloatList(desc : OperationDescription, attr_name : LibC::Char*, values : LibC::Float*, num_values : LibC::Int)
  fun set_attr_bool = TF_SetAttrBool(desc : OperationDescription, attr_name : LibC::Char*, value : UInt8)
  fun set_attr_bool_list = TF_SetAttrBoolList(desc : OperationDescription, attr_name : LibC::Char*, values : UInt8*, num_values : LibC::Int)
  fun set_attr_type = TF_SetAttrType(desc : OperationDescription, attr_name : LibC::Char*, value : DataType)
  fun set_attr_type_list = TF_SetAttrTypeList(desc : OperationDescription, attr_name : LibC::Char*, values : DataType*, num_values : LibC::Int)
  fun set_attr_shape = TF_SetAttrShape(desc : OperationDescription, attr_name : LibC::Char*, dims : Int64T*, num_dims : LibC::Int)
  fun set_attr_shape_list = TF_SetAttrShapeList(desc : OperationDescription, attr_name : LibC::Char*, dims : Int64T**, num_dims : LibC::Int*, num_shapes : LibC::Int)
  fun set_attr_tensor_shape_proto = TF_SetAttrTensorShapeProto(desc : OperationDescription, attr_name : LibC::Char*, proto : Void*, proto_len : LibC::Int, status : Status)
  fun set_attr_tensor_shape_proto_list = TF_SetAttrTensorShapeProtoList(desc : OperationDescription, attr_name : LibC::Char*, protos : Void**, proto_lens : LibC::Int*, num_shapes : LibC::Int, status : Status)
  fun set_attr_tensor = TF_SetAttrTensor(desc : OperationDescription, attr_name : LibC::Char*, value : Tensor, status : Status)
  fun set_attr_tensor_list = TF_SetAttrTensorList(desc : OperationDescription, attr_name : LibC::Char*, values : Tensor*, num_values : LibC::Int, status : Status)
  fun set_attr_value_proto = TF_SetAttrValueProto(desc : OperationDescription, attr_name : LibC::Char*, proto : Void*, proto_len : LibC::Int, status : Status)
  fun finish_operation = TF_FinishOperation(desc : OperationDescription, status : Status) : Operation
  fun operation_name = TF_OperationName(oper : Operation) : LibC::Char*
  fun operation_op_type = TF_OperationOpType(oper : Operation) : LibC::Char*
  fun operation_device = TF_OperationDevice(oper : Operation) : LibC::Char*
  fun operation_num_outputs = TF_OperationNumOutputs(oper : Operation) : LibC::Int
  fun operation_output_type = TF_OperationOutputType(oper_out : Output) : DataType
  fun operation_output_list_length = TF_OperationOutputListLength(oper : Operation, arg_name : LibC::Char*, status : Status) : LibC::Int
  fun operation_num_inputs = TF_OperationNumInputs(oper : Operation) : LibC::Int
  fun operation_input_type = TF_OperationInputType(oper_in : Input) : DataType
  fun operation_input_list_length = TF_OperationInputListLength(oper : Operation, arg_name : LibC::Char*, status : Status) : LibC::Int
  fun operation_input = TF_OperationInput(oper_in : Input) : Output
  fun operation_output_num_consumers = TF_OperationOutputNumConsumers(oper_out : Output) : LibC::Int
  fun operation_output_consumers = TF_OperationOutputConsumers(oper_out : Output, consumers : Input*, max_consumers : LibC::Int) : LibC::Int
  fun operation_num_control_inputs = TF_OperationNumControlInputs(oper : Operation) : LibC::Int
  fun operation_get_control_inputs = TF_OperationGetControlInputs(oper : Operation, control_inputs : Operation*, max_control_inputs : LibC::Int) : LibC::Int
  fun operation_num_control_outputs = TF_OperationNumControlOutputs(oper : Operation) : LibC::Int
  fun operation_get_control_outputs = TF_OperationGetControlOutputs(oper : Operation, control_outputs : Operation*, max_control_outputs : LibC::Int) : LibC::Int
  fun operation_get_attr_metadata = TF_OperationGetAttrMetadata(oper : Operation, attr_name : LibC::Char*, status : Status) : AttrMetadata
  fun operation_get_attr_string = TF_OperationGetAttrString(oper : Operation, attr_name : LibC::Char*, value : Void*, max_length : LibC::Int, status : Status)
  fun operation_get_attr_string_list = TF_OperationGetAttrStringList(oper : Operation, attr_name : LibC::Char*, values : Void**, lengths : LibC::Int*, max_values : LibC::Int, storage : Void*, storage_size : LibC::Int, status : Status)
  fun operation_get_attr_int = TF_OperationGetAttrInt(oper : Operation, attr_name : LibC::Char*, value : Int64T*, status : Status)
  fun operation_get_attr_int_list = TF_OperationGetAttrIntList(oper : Operation, attr_name : LibC::Char*, values : Int64T*, max_values : LibC::Int, status : Status)
  fun operation_get_attr_float = TF_OperationGetAttrFloat(oper : Operation, attr_name : LibC::Char*, value : LibC::Float*, status : Status)
  fun operation_get_attr_float_list = TF_OperationGetAttrFloatList(oper : Operation, attr_name : LibC::Char*, values : LibC::Float*, max_values : LibC::Int, status : Status)
  fun operation_get_attr_bool = TF_OperationGetAttrBool(oper : Operation, attr_name : LibC::Char*, value : UInt8*, status : Status)
  fun operation_get_attr_bool_list = TF_OperationGetAttrBoolList(oper : Operation, attr_name : LibC::Char*, values : UInt8*, max_values : LibC::Int, status : Status)
  fun operation_get_attr_type = TF_OperationGetAttrType(oper : Operation, attr_name : LibC::Char*, value : DataType*, status : Status)
  fun operation_get_attr_type_list = TF_OperationGetAttrTypeList(oper : Operation, attr_name : LibC::Char*, values : DataType*, max_values : LibC::Int, status : Status)
  fun operation_get_attr_shape = TF_OperationGetAttrShape(oper : Operation, attr_name : LibC::Char*, value : Int64T*, num_dims : LibC::Int, status : Status)
  fun operation_get_attr_shape_list = TF_OperationGetAttrShapeList(oper : Operation, attr_name : LibC::Char*, dims : Int64T**, num_dims : LibC::Int*, num_shapes : LibC::Int, storage : Int64T*, storage_size : LibC::Int, status : Status)
  fun operation_get_attr_tensor_shape_proto = TF_OperationGetAttrTensorShapeProto(oper : Operation, attr_name : LibC::Char*, value : Buffer*, status : Status)
  fun operation_get_attr_tensor_shape_proto_list = TF_OperationGetAttrTensorShapeProtoList(oper : Operation, attr_name : LibC::Char*, values : Buffer**, max_values : LibC::Int, status : Status)
  fun operation_get_attr_tensor = TF_OperationGetAttrTensor(oper : Operation, attr_name : LibC::Char*, value : Tensor*, status : Status)
  fun operation_get_attr_tensor_list = TF_OperationGetAttrTensorList(oper : Operation, attr_name : LibC::Char*, values : Tensor*, max_values : LibC::Int, status : Status)
  fun operation_get_attr_value_proto = TF_OperationGetAttrValueProto(oper : Operation, attr_name : LibC::Char*, output_attr_value : Buffer*, status : Status)
  fun graph_operation_by_name = TF_GraphOperationByName(graph : Graph, oper_name : LibC::Char*) : Operation
  fun graph_next_operation = TF_GraphNextOperation(graph : Graph, pos : LibC::Int*) : Operation
  fun graph_to_graph_def = TF_GraphToGraphDef(graph : Graph, output_graph_def : Buffer*, status : Status)
  fun new_import_graph_def_options = TF_NewImportGraphDefOptions : ImportGraphDefOptions
  fun delete_import_graph_def_options = TF_DeleteImportGraphDefOptions(opts : ImportGraphDefOptions)
  fun import_graph_def_options_set_prefix = TF_ImportGraphDefOptionsSetPrefix(opts : ImportGraphDefOptions, prefix : LibC::Char*)
  fun import_graph_def_options_add_input_mapping = TF_ImportGraphDefOptionsAddInputMapping(opts : ImportGraphDefOptions, src_name : LibC::Char*, src_index : LibC::Int, dst : Output)
  fun import_graph_def_options_remap_control_dependency = TF_ImportGraphDefOptionsRemapControlDependency(opts : ImportGraphDefOptions, src_name : LibC::Char*, dst : Operation)
  fun import_graph_def_options_add_control_dependency = TF_ImportGraphDefOptionsAddControlDependency(opts : ImportGraphDefOptions, oper : Operation)
  fun import_graph_def_options_add_return_output = TF_ImportGraphDefOptionsAddReturnOutput(opts : ImportGraphDefOptions, oper_name : LibC::Char*, index : LibC::Int)
  fun import_graph_def_options_num_return_outputs = TF_ImportGraphDefOptionsNumReturnOutputs(opts : ImportGraphDefOptions) : LibC::Int
  fun graph_import_graph_def_with_return_outputs = TF_GraphImportGraphDefWithReturnOutputs(graph : Graph, graph_def : Buffer*, options : ImportGraphDefOptions, return_outputs : Output*, num_return_outputs : LibC::Int, status : Status)
  fun graph_import_graph_def = TF_GraphImportGraphDef(graph : Graph, graph_def : Buffer*, options : ImportGraphDefOptions, status : Status)
  fun operation_to_node_def = TF_OperationToNodeDef(oper : Operation, output_node_def : Buffer*, status : Status)
  fun new_while = TF_NewWhile(g : Graph, inputs : Output*, ninputs : LibC::Int, status : Status) : WhileParams
  fun finish_while = TF_FinishWhile(params : WhileParams*, status : Status, outputs : Output*)
  fun abort_while = TF_AbortWhile(params : WhileParams*)
  fun add_gradients = TF_AddGradients(g : Graph, y : Output*, ny : LibC::Int, x : Output*, nx : LibC::Int, dx : Output*, status : Status, dy : Output*)
  fun new_session = TF_NewSession(graph : Graph, opts : SessionOptions, status : Status) : Session
  fun load_session_from_saved_model = TF_LoadSessionFromSavedModel(session_options : SessionOptions, run_options : Buffer*, export_dir : LibC::Char*, tags : LibC::Char**, tags_len : LibC::Int, graph : Graph, meta_graph_def : Buffer*, status : Status) : Session
  fun close_session = TF_CloseSession(x0 : Session, status : Status)
  fun delete_session = TF_DeleteSession(x0 : Session, status : Status)
  fun session_run = TF_SessionRun(session : Session, run_options : Buffer*, inputs : Output*, input_values : Tensor*, ninputs : LibC::Int, outputs : Output*, output_values : Tensor*, noutputs : LibC::Int, target_opers : Operation*, ntargets : LibC::Int, run_metadata : Buffer*, x11 : Status)
  fun session_p_run_setup = TF_SessionPRunSetup(x0 : Session, inputs : Output*, ninputs : LibC::Int, outputs : Output*, noutputs : LibC::Int, target_opers : Operation*, ntargets : LibC::Int, handle : LibC::Char**, x8 : Status)
  fun session_p_run = TF_SessionPRun(x0 : Session, handle : LibC::Char*, inputs : Output*, input_values : Tensor*, ninputs : LibC::Int, outputs : Output*, output_values : Tensor*, noutputs : LibC::Int, target_opers : Operation*, ntargets : LibC::Int, x10 : Status)
  fun delete_p_run_handle = TF_DeletePRunHandle(handle : LibC::Char*)
  fun new_deprecated_session = TF_NewDeprecatedSession(x0 : SessionOptions, status : Status) : DeprecatedSession
  fun close_deprecated_session = TF_CloseDeprecatedSession(x0 : DeprecatedSession, status : Status)
  fun delete_deprecated_session = TF_DeleteDeprecatedSession(x0 : DeprecatedSession, status : Status)
  fun reset = TF_Reset(opt : SessionOptions, containers : LibC::Char**, ncontainers : LibC::Int, status : Status)
  fun extend_graph = TF_ExtendGraph(x0 : DeprecatedSession, proto : Void*, proto_len : LibC::Int, x3 : Status)
  fun run = TF_Run(x0 : DeprecatedSession, run_options : Buffer*, input_names : LibC::Char**, inputs : Tensor*, ninputs : LibC::Int, output_names : LibC::Char**, outputs : Tensor*, noutputs : LibC::Int, target_oper_names : LibC::Char**, ntargets : LibC::Int, run_metadata : Buffer*, x11 : Status)
  fun p_run_setup = TF_PRunSetup(x0 : DeprecatedSession, input_names : LibC::Char**, ninputs : LibC::Int, output_names : LibC::Char**, noutputs : LibC::Int, target_oper_names : LibC::Char**, ntargets : LibC::Int, handle : LibC::Char**, x8 : Status)
  fun p_run = TF_PRun(x0 : DeprecatedSession, handle : LibC::Char*, input_names : LibC::Char**, inputs : Tensor*, ninputs : LibC::Int, output_names : LibC::Char**, outputs : Tensor*, noutputs : LibC::Int, target_oper_names : LibC::Char**, ntargets : LibC::Int, x10 : Status)
  fun session_list_devices = TF_SessionListDevices(session : Session, status : Status) : DeviceList
  fun deprecated_session_list_devices = TF_DeprecatedSessionListDevices(session : DeprecatedSession, status : Status) : DeviceList
  fun delete_device_list = TF_DeleteDeviceList(list : DeviceList)
  fun device_list_count = TF_DeviceListCount(list : DeviceList) : LibC::Int
  fun device_list_name = TF_DeviceListName(list : DeviceList, index : LibC::Int, x2 : Status) : LibC::Char*
  fun device_list_type = TF_DeviceListType(list : DeviceList, index : LibC::Int, x2 : Status) : LibC::Char*
  fun device_list_memory_bytes = TF_DeviceListMemoryBytes(list : DeviceList, index : LibC::Int, x2 : Status) : Int64T
  fun load_library = TF_LoadLibrary(library_filename : LibC::Char*, status : Status) : Library
  fun get_op_list = TF_GetOpList(lib_handle : Library) : Buffer
  fun delete_library_handle = TF_DeleteLibraryHandle(lib_handle : Library)
  fun get_all_op_list = TF_GetAllOpList : Buffer*
end
