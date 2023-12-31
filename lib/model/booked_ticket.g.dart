part of 'booked_ticket.dart';

class TableTicket extends SqfEntityTableBase {
  TableTicket() {
    tableName = 'ticket';
    primaryKeyName = 'ticketID';
    primaryKeyType = PrimaryKeyType.integer_unique;
    useSoftDeleting = false;

    fields = [
      SqfEntityFieldBase('movieID', DbType.integer),
      SqfEntityFieldBase('customerName', DbType.text),
      SqfEntityFieldBase('email', DbType.text),
      SqfEntityFieldBase('customerID', DbType.integer),
      SqfEntityFieldBase('contactNumber', DbType.integer),
      SqfEntityFieldBase('movieTitle', DbType.text),
      SqfEntityFieldBase('movieStartTime', DbType.integer),
      SqfEntityFieldBase('movieEndTime', DbType.integer),
    ];
    super.init();
  }
  static SqfEntityTableBase? _instance;
  static SqfEntityTableBase get getInstance {
    return _instance = _instance ?? TableTicket();
  }
}

class BookedTicket extends SqfEntityModelProvider {
  BookedTicket() {
    databaseName = myDbModel.databaseName;
    password = myDbModel.password;
    dbVersion = myDbModel.dbVersion;
    preSaveAction = myDbModel.preSaveAction;
    logFunction = myDbModel.logFunction;
    databaseTables = [
      TableTicket.getInstance,
    ];

    bundledDatabasePath = myDbModel
        .bundledDatabasePath; //'assets/sample.db'; // This value is optional. When bundledDatabasePath is empty then EntityBase creats a new database when initializing the database
    databasePath = myDbModel.databasePath;
  }
  Map<String, dynamic> getControllers() {
    final controllers = <String, dynamic>{};

    return controllers;
  }
}

class Ticket extends TableBase {
  Ticket(
      {this.ticketID,
      this.movieID,
      this.customerName,
      this.email,
      this.customerID,
      this.contactNumber,
      this.movieTitle,
      this.movieStartTime,
      this.movieEndTime}) {
    _setDefaultValues();
    softDeleteActivated = false;
  }
  Ticket.withFields(
      this.ticketID,
      this.movieID,
      this.customerName,
      this.email,
      this.customerID,
      this.contactNumber,
      this.movieTitle,
      this.movieStartTime,
      this.movieEndTime) {
    _setDefaultValues();
  }
  Ticket.withId(
      this.ticketID,
      this.movieID,
      this.customerName,
      this.email,
      this.customerID,
      this.contactNumber,
      this.movieTitle,
      this.movieStartTime,
      this.movieEndTime) {
    _setDefaultValues();
  }
  Ticket.fromMap(Map<String, dynamic> o, {bool setDefaultValues = true}) {
    if (setDefaultValues) {
      _setDefaultValues();
    }
    ticketID = int.tryParse(o['ticketID'].toString());
    if (o['movieID'] != null) {
      movieID = int.tryParse(o['movieID'].toString());
    }
    if (o['customerName'] != null) {
      customerName = o['customerName'].toString();
    }
    if (o['email'] != null) {
      email = o['email'].toString();
    }
    if (o['customerID'] != null) {
      customerID = int.tryParse(o['customerID'].toString());
    }
    if (o['contactNumber'] != null) {
      contactNumber = int.tryParse(o['contactNumber'].toString());
    }
    if (o['movieTitle'] != null) {
      movieTitle = o['movieTitle'].toString();
    }
    if (o['movieStartTime'] != null) {
      movieStartTime = int.tryParse(o['movieStartTime'].toString());
    }
    if (o['movieEndTime'] != null) {
      movieEndTime = int.tryParse(o['movieEndTime'].toString());
    }

    isSaved = true;
  }
  int? ticketID;
  int? movieID;
  String? customerName;
  String? email;
  int? customerID;
  int? contactNumber;
  String? movieTitle;
  int? movieStartTime;
  int? movieEndTime;
  bool? isSaved;
  // end FIELDS (Ticket)

  static const bool _softDeleteActivated = false;
  TicketManager? __mnTicket;

  TicketManager get _mnTicket {
    return __mnTicket = __mnTicket ?? TicketManager();
  }

  // METHODS
  @override
  Map<String, dynamic> toMap(
      {bool forQuery = false, bool forJson = false, bool forView = false}) {
    final map = <String, dynamic>{};
    map['ticketID'] = ticketID;
    if (movieID != null || !forView) {
      map['movieID'] = movieID;
    }
    if (customerName != null || !forView) {
      map['customerName'] = customerName;
    }
    if (email != null || !forView) {
      map['email'] = email;
    }
    if (customerID != null || !forView) {
      map['customerID'] = customerID;
    }
    if (contactNumber != null || !forView) {
      map['contactNumber'] = contactNumber;
    }
    if (movieTitle != null || !forView) {
      map['movieTitle'] = movieTitle;
    }
    if (movieStartTime != null || !forView) {
      map['movieStartTime'] = movieStartTime;
    }
    if (movieEndTime != null || !forView) {
      map['movieEndTime'] = movieEndTime;
    }

    return map;
  }

  @override
  Future<Map<String, dynamic>> toMapWithChildren(
      [bool forQuery = false,
      bool forJson = false,
      bool forView = false]) async {
    final map = <String, dynamic>{};
    map['ticketID'] = ticketID;
    if (movieID != null || !forView) {
      map['movieID'] = movieID;
    }
    if (customerName != null || !forView) {
      map['customerName'] = customerName;
    }
    if (email != null || !forView) {
      map['email'] = email;
    }
    if (customerID != null || !forView) {
      map['customerID'] = customerID;
    }
    if (contactNumber != null || !forView) {
      map['contactNumber'] = contactNumber;
    }
    if (movieTitle != null || !forView) {
      map['movieTitle'] = movieTitle;
    }
    if (movieStartTime != null || !forView) {
      map['movieStartTime'] = movieStartTime;
    }
    if (movieEndTime != null || !forView) {
      map['movieEndTime'] = movieEndTime;
    }

    return map;
  }

  /// This method returns Json String [Ticket]
  @override
  String toJson() {
    return json.encode(toMap(forJson: true));
  }

  /// This method returns Json String [Ticket]
  @override
  Future<String> toJsonWithChilds() async {
    return json.encode(await toMapWithChildren(false, true));
  }

  @override
  List<dynamic> toArgs() {
    return [
      ticketID,
      movieID,
      customerName,
      email,
      customerID,
      contactNumber,
      movieTitle,
      movieStartTime,
      movieEndTime
    ];
  }

  @override
  List<dynamic> toArgsWithIds() {
    return [
      ticketID,
      movieID,
      customerName,
      email,
      customerID,
      contactNumber,
      movieTitle,
      movieStartTime,
      movieEndTime
    ];
  }

  static Future<List<Ticket>?> fromWebUrl(Uri uri,
      {Map<String, String>? headers}) async {
    try {
      final response = await http.get(uri, headers: headers);
      return await fromJson(response.body);
    } catch (e) {
      debugPrint(
          'SQFENTITY ERROR Ticket.fromWebUrl: ErrorMessage: ${e.toString()}');
      return null;
    }
  }

  Future<http.Response> postUrl(Uri uri, {Map<String, String>? headers}) {
    return http.post(uri, headers: headers, body: toJson());
  }

  static Future<List<Ticket>> fromJson(String jsonBody) async {
    final Iterable list = await json.decode(jsonBody) as Iterable;
    var objList = <Ticket>[];
    try {
      objList = list
          .map((ticket) => Ticket.fromMap(ticket as Map<String, dynamic>))
          .toList();
    } catch (e) {
      debugPrint(
          'SQFENTITY ERROR Ticket.fromJson: ErrorMessage: ${e.toString()}');
    }
    return objList;
  }

  static Future<List<Ticket>> fromMapList(List<dynamic> data,
      {bool preload = false,
      List<String>? preloadFields,
      bool loadParents = false,
      List<String>? loadedFields,
      bool setDefaultValues = true}) async {
    final List<Ticket> objList = <Ticket>[];
    loadedFields = loadedFields ?? [];
    for (final map in data) {
      final obj = Ticket.fromMap(map as Map<String, dynamic>,
          setDefaultValues: setDefaultValues);

      objList.add(obj);
    }
    return objList;
  }

  /// returns Ticket by ID if exist, otherwise returns null
  /// Primary Keys: int? ticketID
  /// bool preload: if true, loads all related child objects (Set preload to true if you want to load all fields related to child or parent)
  /// ex: getById(preload:true) -> Loads all related objects
  /// List<String> preloadFields: specify the fields you want to preload (preload parameter's value should also be "true")
  /// ex: getById(preload:true, preloadFields:['plField1','plField2'... etc])  -> Loads only certain fields what you specified
  /// bool loadParents: if true, loads all parent objects until the object has no parent

  /// <returns>returns [Ticket] if exist, otherwise returns null
  Future<Ticket?> getById(int? ticketID,
      {bool preload = false,
      List<String>? preloadFields,
      bool loadParents = false,
      List<String>? loadedFields}) async {
    if (ticketID == null) {
      return null;
    }
    Ticket? obj;
    final data = await _mnTicket.getById([ticketID]);
    if (data.length != 0) {
      obj = Ticket.fromMap(data[0] as Map<String, dynamic>);
    } else {
      obj = null;
    }
    return obj;
  }

  /// Saves the (Ticket) object. If the ticketID field is null, saves as a new record and returns new ticketID, if ticketID is not null then updates record
  /// ignoreBatch = true as a default. Set ignoreBatch to false if you run more than one save() operation those are between batchStart and batchCommit
  /// <returns>Returns ticketID
  @override
  Future<int?> save({bool ignoreBatch = true}) async {
    if (ticketID == null || ticketID == 0 || !isSaved!) {
      await _mnTicket.insert(this, ignoreBatch);
      if (saveResult!.success) {
        isSaved = true;
      }
    } else {
      await _mnTicket.update(this);
    }

    return ticketID;
  }

  /// Saves the (Ticket) object. If the ticketID field is null, saves as a new record and returns new ticketID, if ticketID is not null then updates record
  /// ignoreBatch = true as a default. Set ignoreBatch to false if you run more than one save() operation those are between batchStart and batchCommit
  /// <returns>Returns ticketID
  @override
  Future<int?> saveOrThrow({bool ignoreBatch = true}) async {
    if (ticketID == null || ticketID == 0 || !isSaved!) {
      await _mnTicket.insertOrThrow(this, ignoreBatch);
      if (saveResult != null && saveResult!.success) {
        isSaved = true;
      }
      isInsert = true;
    } else {
      // ticketID= await _upsert(); // removed in sqfentity_gen 1.3.0+6
      await _mnTicket.updateOrThrow(this);
    }

    return ticketID;
  }

  /// saveAll method saves the sent List<Ticket> as a bulk in one transaction
  /// Returns a <List<BoolResult>>
  static Future<List<dynamic>> saveAll(List<Ticket> tickets,
      {bool? exclusive, bool? noResult, bool? continueOnError}) async {
    List<dynamic>? result = [];
    // If there is no open transaction, start one
    final isStartedBatch = await BookedTicket().batchStart();
    for (final obj in tickets) {
      await obj.save(ignoreBatch: false);
    }
    if (!isStartedBatch) {
      result = await BookedTicket().batchCommit(
          exclusive: exclusive,
          noResult: noResult,
          continueOnError: continueOnError);
    }
    return result!;
  }

  /// Updates if the record exists, otherwise adds a new row
  /// <returns>Returns ticketID
  @override
  Future<int?> upsert({bool ignoreBatch = true}) async {
    try {
      final result = await _mnTicket.rawInsert(
          'INSERT OR REPLACE INTO ticket (ticketID, movieID, customerName, email, customerID, contactNumber, movieTitle, movieStartTime, movieEndTime)  VALUES (?,?,?,?,?,?,?,?,?)',
          [
            ticketID,
            movieID,
            customerName,
            email,
            customerID,
            contactNumber,
            movieTitle,
            movieStartTime,
            movieEndTime
          ],
          ignoreBatch);
      if (result! > 0) {
        saveResult = BoolResult(
            success: true,
            successMessage: 'Ticket ticketID=$ticketID updated successfully');
      } else {
        saveResult = BoolResult(
            success: false,
            errorMessage: 'Ticket ticketID=$ticketID did not update');
      }
      return ticketID;
    } catch (e) {
      saveResult = BoolResult(
          success: false,
          errorMessage: 'Ticket Save failed. Error: ${e.toString()}');
      return null;
    }
  }

  /// inserts or replaces the sent List<<Ticket>> as a bulk in one transaction.
  /// upsertAll() method is faster then saveAll() method. upsertAll() should be used when you are sure that the primary key is greater than zero
  /// Returns a BoolCommitResult
  @override
  Future<BoolCommitResult> upsertAll(List<Ticket> tickets,
      {bool? exclusive, bool? noResult, bool? continueOnError}) async {
    final results = await _mnTicket.rawInsertAll(
        'INSERT OR REPLACE INTO ticket (ticketID, movieID, customerName, email, customerID, contactNumber, movieTitle, movieStartTime, movieEndTime)  VALUES (?,?,?,?,?,?,?,?,?)',
        tickets,
        exclusive: exclusive,
        noResult: noResult,
        continueOnError: continueOnError);
    return results;
  }

  /// Deletes Ticket

  /// <returns>BoolResult res.success= true (Deleted), false (Could not be deleted)
  @override
  Future<BoolResult> delete([bool hardDelete = false]) async {
    debugPrint('SQFENTITIY: delete Ticket invoked (ticketID=$ticketID)');
    if (!_softDeleteActivated || hardDelete) {
      return _mnTicket.delete(
          QueryParams(whereString: 'ticketID=?', whereArguments: [ticketID]));
    } else {
      return _mnTicket.updateBatch(
          QueryParams(whereString: 'ticketID=?', whereArguments: [ticketID]),
          {'isDeleted': 1});
    }
  }

  @override
  Future<BoolResult> recover([bool recoverChilds = true]) {
    // not implemented because:
    final msg =
        'set useSoftDeleting:true in the table definition of [Ticket] to use this feature';
    throw UnimplementedError(msg);
  }

  @override
  TicketFilterBuilder select(
      {List<String>? columnsToSelect, bool? getIsDeleted}) {
    return TicketFilterBuilder(this, getIsDeleted)
      ..qparams.selectColumns = columnsToSelect;
  }

  @override
  TicketFilterBuilder distinct(
      {List<String>? columnsToSelect, bool? getIsDeleted}) {
    return TicketFilterBuilder(this, getIsDeleted)
      ..qparams.selectColumns = columnsToSelect
      ..qparams.distinct = true;
  }

  void _setDefaultValues() {
    isSaved = false;
  }

  @override
  void rollbackPk() {
    if (isInsert == true) {
      ticketID = null;
    }
  }

  // END METHODS
  // BEGIN CUSTOM CODE
  /*
      you can define customCode property of your SqfEntityTable constant. For example:
      const tablePerson = SqfEntityTable(
      tableName: 'person',
      primaryKeyName: 'id',
      primaryKeyType: PrimaryKeyType.integer_auto_incremental,
      fields: [
        SqfEntityField('firstName', DbType.text),
        SqfEntityField('lastName', DbType.text),
      ],
      customCode: '''
       String fullName()
       { 
         return '$firstName $lastName';
       }
      ''');
     */
  // END CUSTOM CODE
}
// endregion ticket

// region TicketField
class TicketField extends FilterBase {
  TicketField(TicketFilterBuilder ticketFB) : super(ticketFB);

  @override
  TicketFilterBuilder equals(dynamic pValue) {
    return super.equals(pValue) as TicketFilterBuilder;
  }

  @override
  TicketFilterBuilder equalsOrNull(dynamic pValue) {
    return super.equalsOrNull(pValue) as TicketFilterBuilder;
  }

  @override
  TicketFilterBuilder isNull() {
    return super.isNull() as TicketFilterBuilder;
  }

  @override
  TicketFilterBuilder contains(dynamic pValue) {
    return super.contains(pValue) as TicketFilterBuilder;
  }

  @override
  TicketFilterBuilder startsWith(dynamic pValue) {
    return super.startsWith(pValue) as TicketFilterBuilder;
  }

  @override
  TicketFilterBuilder endsWith(dynamic pValue) {
    return super.endsWith(pValue) as TicketFilterBuilder;
  }

  @override
  TicketFilterBuilder between(dynamic pFirst, dynamic pLast) {
    return super.between(pFirst, pLast) as TicketFilterBuilder;
  }

  @override
  TicketFilterBuilder greaterThan(dynamic pValue) {
    return super.greaterThan(pValue) as TicketFilterBuilder;
  }

  @override
  TicketFilterBuilder lessThan(dynamic pValue) {
    return super.lessThan(pValue) as TicketFilterBuilder;
  }

  @override
  TicketFilterBuilder greaterThanOrEquals(dynamic pValue) {
    return super.greaterThanOrEquals(pValue) as TicketFilterBuilder;
  }

  @override
  TicketFilterBuilder lessThanOrEquals(dynamic pValue) {
    return super.lessThanOrEquals(pValue) as TicketFilterBuilder;
  }

  @override
  TicketFilterBuilder inValues(dynamic pValue) {
    return super.inValues(pValue) as TicketFilterBuilder;
  }

  @override
  TicketField get not {
    return super.not as TicketField;
  }
}
// endregion TicketField

// region TicketFilterBuilder
class TicketFilterBuilder extends ConjunctionBase {
  TicketFilterBuilder(Ticket obj, bool? getIsDeleted)
      : super(obj, getIsDeleted) {
    _mnTicket = obj._mnTicket;
    _softDeleteActivated = obj.softDeleteActivated;
  }

  bool _softDeleteActivated = false;
  TicketManager? _mnTicket;

  /// put the sql keyword 'AND'
  @override
  TicketFilterBuilder get and {
    super.and;
    return this;
  }

  /// put the sql keyword 'OR'
  @override
  TicketFilterBuilder get or {
    super.or;
    return this;
  }

  /// open parentheses
  @override
  TicketFilterBuilder get startBlock {
    super.startBlock;
    return this;
  }

  /// String whereCriteria, write raw query without 'where' keyword. Like this: 'field1 like 'test%' and field2 = 3'
  @override
  TicketFilterBuilder where(String? whereCriteria, {dynamic parameterValue}) {
    super.where(whereCriteria, parameterValue: parameterValue);
    return this;
  }

  /// page = page number,
  /// pagesize = row(s) per page
  @override
  TicketFilterBuilder page(int page, int pagesize) {
    super.page(page, pagesize);
    return this;
  }

  /// int count = LIMIT
  @override
  TicketFilterBuilder top(int count) {
    super.top(count);
    return this;
  }

  /// close parentheses
  @override
  TicketFilterBuilder get endBlock {
    super.endBlock;
    return this;
  }

  /// argFields might be String or List<String>.
  /// Example 1: argFields='name, date'
  /// Example 2: argFields = ['name', 'date']
  @override
  TicketFilterBuilder orderBy(dynamic argFields) {
    super.orderBy(argFields);
    return this;
  }

  /// argFields might be String or List<String>.
  /// Example 1: argFields='field1, field2'
  /// Example 2: argFields = ['field1', 'field2']
  @override
  TicketFilterBuilder orderByDesc(dynamic argFields) {
    super.orderByDesc(argFields);
    return this;
  }

  /// argFields might be String or List<String>.
  /// Example 1: argFields='field1, field2'
  /// Example 2: argFields = ['field1', 'field2']
  @override
  TicketFilterBuilder groupBy(dynamic argFields) {
    super.groupBy(argFields);
    return this;
  }

  /// argFields might be String or List<String>.
  /// Example 1: argFields='name, date'
  /// Example 2: argFields = ['name', 'date']
  @override
  TicketFilterBuilder having(dynamic argFields) {
    super.having(argFields);
    return this;
  }

  TicketField _setField(TicketField? field, String colName, DbType dbtype) {
    return TicketField(this)
      ..param = DbParameter(
          dbType: dbtype, columnName: colName, wStartBlock: openedBlock);
  }

  TicketField? _ticketID;
  TicketField get ticketID {
    return _ticketID = _setField(_ticketID, 'ticketID', DbType.integer);
  }

  TicketField? _movieID;
  TicketField get movieID {
    return _movieID = _setField(_movieID, 'movieID', DbType.integer);
  }

  TicketField? _customerName;
  TicketField get customerName {
    return _customerName =
        _setField(_customerName, 'customerName', DbType.text);
  }

  TicketField? _email;
  TicketField get email {
    return _email = _setField(_email, 'email', DbType.text);
  }

  TicketField? _customerID;
  TicketField get customerID {
    return _customerID = _setField(_customerID, 'customerID', DbType.integer);
  }

  TicketField? _contactNumber;
  TicketField get contactNumber {
    return _contactNumber =
        _setField(_contactNumber, 'contactNumber', DbType.integer);
  }

  TicketField? _movieTitle;
  TicketField get movieTitle {
    return _movieTitle = _setField(_movieTitle, 'movieTitle', DbType.text);
  }

  TicketField? _movieStartTime;
  TicketField get movieStartTime {
    return _movieStartTime =
        _setField(_movieStartTime, 'movieStartTime', DbType.integer);
  }

  TicketField? _movieEndTime;
  TicketField get movieEndTime {
    return _movieEndTime =
        _setField(_movieEndTime, 'movieEndTime', DbType.integer);
  }

  /// Deletes List<Ticket> bulk by query
  ///
  /// <returns>BoolResult res.success= true (Deleted), false (Could not be deleted)
  @override
  Future<BoolResult> delete([bool hardDelete = false]) async {
    buildParameters();
    var r = BoolResult(success: false);

    if (_softDeleteActivated && !hardDelete) {
      r = await _mnTicket!.updateBatch(qparams, {'isDeleted': 1});
    } else {
      r = await _mnTicket!.delete(qparams);
    }
    return r;
  }

  /// using:
  /// update({'fieldName': Value})
  /// fieldName must be String. Value is dynamic, it can be any of the (int, bool, String.. )
  @override
  Future<BoolResult> update(Map<String, dynamic> values) {
    buildParameters();
    if (qparams.limit! > 0 || qparams.offset! > 0) {
      qparams.whereString =
          'ticketID IN (SELECT ticketID from ticket ${qparams.whereString!.isNotEmpty ? 'WHERE ${qparams.whereString}' : ''}${qparams.limit! > 0 ? ' LIMIT ${qparams.limit}' : ''}${qparams.offset! > 0 ? ' OFFSET ${qparams.offset}' : ''})';
    }
    return _mnTicket!.updateBatch(qparams, values);
  }

  /// This method always returns [Ticket] Obj if exist, otherwise returns null
  /// bool preload: if true, loads all related child objects (Set preload to true if you want to load all fields related to child or parent)
  /// ex: toSingle(preload:true) -> Loads all related objects
  /// List<String> preloadFields: specify the fields you want to preload (preload parameter's value should also be "true")
  /// ex: toSingle(preload:true, preloadFields:['plField1','plField2'... etc])  -> Loads only certain fields what you specified
  /// bool loadParents: if true, loads all parent objects until the object has no parent

  /// <returns> Ticket?
  @override
  Future<Ticket?> toSingle(
      {bool preload = false,
      List<String>? preloadFields,
      bool loadParents = false,
      List<String>? loadedFields}) async {
    buildParameters(pSize: 1);
    final objFuture = _mnTicket!.toList(qparams);
    final data = await objFuture;
    Ticket? obj;
    if (data.isNotEmpty) {
      obj = Ticket.fromMap(data[0] as Map<String, dynamic>);
    } else {
      obj = null;
    }
    return obj;
  }

  /// This method always returns [Ticket]
  /// bool preload: if true, loads all related child objects (Set preload to true if you want to load all fields related to child or parent)
  /// ex: toSingle(preload:true) -> Loads all related objects
  /// List<String> preloadFields: specify the fields you want to preload (preload parameter's value should also be "true")
  /// ex: toSingle(preload:true, preloadFields:['plField1','plField2'... etc])  -> Loads only certain fields what you specified
  /// bool loadParents: if true, loads all parent objects until the object has no parent

  /// <returns> Ticket?
  @override
  Future<Ticket> toSingleOrDefault(
      {bool preload = false,
      List<String>? preloadFields,
      bool loadParents = false,
      List<String>? loadedFields}) async {
    return await toSingle(
            preload: preload,
            preloadFields: preloadFields,
            loadParents: loadParents,
            loadedFields: loadedFields) ??
        Ticket();
  }

  /// This method returns int. [Ticket]
  /// <returns>int
  @override
  Future<int> toCount([VoidCallback Function(int c)? ticketCount]) async {
    buildParameters();
    qparams.selectColumns = ['COUNT(1) AS CNT'];
    final ticketsFuture = await _mnTicket!.toList(qparams);
    final int count = ticketsFuture[0]['CNT'] as int;
    if (ticketCount != null) {
      ticketCount(count);
    }
    return count;
  }

  /// This method returns List<Ticket> [Ticket]
  /// bool preload: if true, loads all related child objects (Set preload to true if you want to load all fields related to child or parent)
  /// ex: toList(preload:true) -> Loads all related objects
  /// List<String> preloadFields: specify the fields you want to preload (preload parameter's value should also be "true")
  /// ex: toList(preload:true, preloadFields:['plField1','plField2'... etc])  -> Loads only certain fields what you specified
  /// bool loadParents: if true, loads all parent objects until the object has no parent

  /// <returns>List<Ticket>
  @override
  Future<List<Ticket>> toList(
      {bool preload = false,
      List<String>? preloadFields,
      bool loadParents = false,
      List<String>? loadedFields}) async {
    final data = await toMapList();
    final List<Ticket> ticketsData = await Ticket.fromMapList(data,
        preload: preload,
        preloadFields: preloadFields,
        loadParents: loadParents,
        loadedFields: loadedFields,
        setDefaultValues: qparams.selectColumns == null);
    return ticketsData;
  }

  /// This method returns Json String [Ticket]
  @override
  Future<String> toJson() async {
    final list = <dynamic>[];
    final data = await toList();
    for (var o in data) {
      list.add(o.toMap(forJson: true));
    }
    return json.encode(list);
  }

  /// This method returns Json String. [Ticket]
  @override
  Future<String> toJsonWithChilds() async {
    final list = <dynamic>[];
    final data = await toList();
    for (var o in data) {
      list.add(await o.toMapWithChildren(false, true));
    }
    return json.encode(list);
  }

  /// This method returns List<dynamic>. [Ticket]
  /// <returns>List<dynamic>
  @override
  Future<List<dynamic>> toMapList() async {
    buildParameters();
    return await _mnTicket!.toList(qparams);
  }

  /// This method returns Primary Key List SQL and Parameters retVal = Map<String,dynamic>. [Ticket]
  /// retVal['sql'] = SQL statement string, retVal['args'] = whereArguments List<dynamic>;
  /// <returns>List<String>
  @override
  Map<String, dynamic> toListPrimaryKeySQL([bool buildParams = true]) {
    final Map<String, dynamic> _retVal = <String, dynamic>{};
    if (buildParams) {
      buildParameters();
    }
    _retVal['sql'] =
        'SELECT `ticketID` FROM ticket WHERE ${qparams.whereString}';
    _retVal['args'] = qparams.whereArguments;
    return _retVal;
  }

  /// This method returns Primary Key List<int>.
  /// <returns>List<int>
  @override
  Future<List<int>> toListPrimaryKey([bool buildParams = true]) async {
    if (buildParams) {
      buildParameters();
    }
    final List<int> ticketIDData = <int>[];
    qparams.selectColumns = ['ticketID'];
    final ticketIDFuture = await _mnTicket!.toList(qparams);

    final int count = ticketIDFuture.length;
    for (int i = 0; i < count; i++) {
      ticketIDData.add(ticketIDFuture[i]['ticketID'] as int);
    }
    return ticketIDData;
  }

  /// Returns List<dynamic> for selected columns. Use this method for 'groupBy' with min,max,avg..  [Ticket]
  /// Sample usage: (see EXAMPLE 4.2 at https://github.com/hhtokpinar/sqfEntity#group-by)
  @override
  Future<List<dynamic>> toListObject() async {
    buildParameters();

    final objectFuture = _mnTicket!.toList(qparams);

    final List<dynamic> objectsData = <dynamic>[];
    final data = await objectFuture;
    final int count = data.length;
    for (int i = 0; i < count; i++) {
      objectsData.add(data[i]);
    }
    return objectsData;
  }

  /// Returns List<String> for selected first column
  /// Sample usage: await Ticket.select(columnsToSelect: ['columnName']).toListString()
  @override
  Future<List<String>> toListString(
      [VoidCallback Function(List<String> o)? listString]) async {
    buildParameters();

    final objectFuture = _mnTicket!.toList(qparams);

    final List<String> objectsData = <String>[];
    final data = await objectFuture;
    final int count = data.length;
    for (int i = 0; i < count; i++) {
      objectsData.add(data[i][qparams.selectColumns![0]].toString());
    }
    if (listString != null) {
      listString(objectsData);
    }
    return objectsData;
  }
}
// endregion TicketFilterBuilder

// region TicketFields
class TicketFields {
  static TableField? _fTicketID;
  static TableField get ticketID {
    return _fTicketID = _fTicketID ??
        SqlSyntax.setField(_fTicketID, 'ticketid', DbType.integer);
  }

  static TableField? _fMovieID;
  static TableField get movieID {
    return _fMovieID =
        _fMovieID ?? SqlSyntax.setField(_fMovieID, 'movieID', DbType.integer);
  }

  static TableField? _fCustomerName;
  static TableField get customerName {
    return _fCustomerName = _fCustomerName ??
        SqlSyntax.setField(_fCustomerName, 'customerName', DbType.text);
  }

  static TableField? _fEmail;
  static TableField get email {
    return _fEmail =
        _fEmail ?? SqlSyntax.setField(_fEmail, 'email', DbType.text);
  }

  static TableField? _fCustomerID;
  static TableField get customerID {
    return _fCustomerID = _fCustomerID ??
        SqlSyntax.setField(_fCustomerID, 'customerID', DbType.integer);
  }

  static TableField? _fContactNumber;
  static TableField get contactNumber {
    return _fContactNumber = _fContactNumber ??
        SqlSyntax.setField(_fContactNumber, 'contactNumber', DbType.integer);
  }

  static TableField? _fMovieTitle;
  static TableField get movieTitle {
    return _fMovieTitle = _fMovieTitle ??
        SqlSyntax.setField(_fMovieTitle, 'movieTitle', DbType.text);
  }

  static TableField? _fMovieStartTime;
  static TableField get movieStartTime {
    return _fMovieStartTime = _fMovieStartTime ??
        SqlSyntax.setField(_fMovieStartTime, 'movieStartTime', DbType.integer);
  }

  static TableField? _fMovieEndTime;
  static TableField get movieEndTime {
    return _fMovieEndTime = _fMovieEndTime ??
        SqlSyntax.setField(_fMovieEndTime, 'movieEndTime', DbType.integer);
  }
}
// endregion TicketFields

//region TicketManager
class TicketManager extends SqfEntityProvider {
  TicketManager()
      : super(BookedTicket(),
            tableName: _tableName,
            primaryKeyList: _primaryKeyList,
            whereStr: _whereStr);
  static const String _tableName = 'ticket';
  static const List<String> _primaryKeyList = ['ticketID'];
  static const String _whereStr = 'ticketID=?';
}

//endregion TicketManager
class BookedTicketSequenceManager extends SqfEntityProvider {
  BookedTicketSequenceManager() : super(BookedTicket());
}
// END OF ENTITIES
