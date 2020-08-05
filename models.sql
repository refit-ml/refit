INSERT INTO cdl_refit.models (project_guid, model_guid, model, timestamp) VALUES ('b6ee5bab-08dd-49b0-98b6-45cd0a28b12f', '7fd8c924-7b21-440c-a53e-a5b54819c15c', textAsBlob('<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<PMML xmlns="http://www.dmg.org/PMML-4_3" xmlns:data="http://jpmml.org/jpmml-model/InlineTable" version="4.3">
	<Header>
		<Application name="JPMML-SparkML" version="1.5.1"/>
		<Timestamp>2020-07-31T19:52:21Z</Timestamp>
	</Header>
	<DataDictionary>
		<DataField name="operable" optype="categorical" dataType="integer">
			<Value value="1"/>
			<Value value="0"/>
		</DataField>
		<DataField name="temperature" optype="continuous" dataType="double"/>
		<DataField name="pressure" optype="continuous" dataType="double"/>
		<DataField name="wind" optype="continuous" dataType="double"/>
	</DataDictionary>
	<MiningModel functionName="classification">
		<MiningSchema>
			<MiningField name="operable" usageType="target"/>
			<MiningField name="wind"/>
			<MiningField name="pressure"/>
			<MiningField name="temperature"/>
		</MiningSchema>
		<Output>
			<OutputField name="pmml(prediction)" optype="categorical" dataType="integer" feature="predictedValue"/>
			<OutputField name="prediction" optype="categorical" dataType="double" feature="transformedValue">
				<MapValues outputColumn="data:output">
					<FieldColumnPair field="pmml(prediction)" column="data:input"/>
					<InlineTable>
						<row>
							<data:input>1</data:input>
							<data:output>0</data:output>
						</row>
						<row>
							<data:input>0</data:input>
							<data:output>1</data:output>
						</row>
					</InlineTable>
				</MapValues>
			</OutputField>
			<OutputField name="probability(1)" optype="continuous" dataType="double" feature="probability" value="1"/>
			<OutputField name="probability(0)" optype="continuous" dataType="double" feature="probability" value="0"/>
		</Output>
		<Segmentation multipleModelMethod="average">
			<Segment id="1">
				<True/>
				<TreeModel functionName="classification" missingValueStrategy="nullPrediction" splitCharacteristic="multiSplit">
					<MiningSchema>
						<MiningField name="temperature"/>
					</MiningSchema>
					<Node>
						<True/>
						<Node score="1" recordCount="120610.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="108663.0"/>
							<ScoreDistribution value="0" recordCount="11947.0"/>
						</Node>
						<Node score="0" recordCount="39660.0">
							<True/>
							<ScoreDistribution value="1" recordCount="9941.0"/>
							<ScoreDistribution value="0" recordCount="29719.0"/>
						</Node>
					</Node>
				</TreeModel>
			</Segment>
			<Segment id="2">
				<True/>
				<TreeModel functionName="classification" missingValueStrategy="nullPrediction" splitCharacteristic="multiSplit">
					<MiningSchema>
						<MiningField name="temperature"/>
					</MiningSchema>
					<Node>
						<True/>
						<Node score="1" recordCount="120507.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="108620.0"/>
							<ScoreDistribution value="0" recordCount="11887.0"/>
						</Node>
						<Node score="0" recordCount="39941.0">
							<True/>
							<ScoreDistribution value="1" recordCount="10248.0"/>
							<ScoreDistribution value="0" recordCount="29693.0"/>
						</Node>
					</Node>
				</TreeModel>
			</Segment>
			<Segment id="3">
				<True/>
				<TreeModel functionName="classification" missingValueStrategy="nullPrediction" splitCharacteristic="multiSplit">
					<MiningSchema>
						<MiningField name="temperature"/>
					</MiningSchema>
					<Node>
						<True/>
						<Node score="1" recordCount="119736.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="108014.0"/>
							<ScoreDistribution value="0" recordCount="11722.0"/>
						</Node>
						<Node score="0" recordCount="39354.0">
							<True/>
							<ScoreDistribution value="1" recordCount="9939.0"/>
							<ScoreDistribution value="0" recordCount="29415.0"/>
						</Node>
					</Node>
				</TreeModel>
			</Segment>
			<Segment id="4">
				<True/>
				<TreeModel functionName="classification" missingValueStrategy="nullPrediction" splitCharacteristic="multiSplit">
					<MiningSchema>
						<MiningField name="temperature"/>
					</MiningSchema>
					<Node>
						<True/>
						<Node score="1" recordCount="121134.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="109293.0"/>
							<ScoreDistribution value="0" recordCount="11841.0"/>
						</Node>
						<Node score="0" recordCount="39695.0">
							<True/>
							<ScoreDistribution value="1" recordCount="10050.0"/>
							<ScoreDistribution value="0" recordCount="29645.0"/>
						</Node>
					</Node>
				</TreeModel>
			</Segment>
			<Segment id="5">
				<True/>
				<TreeModel functionName="classification" missingValueStrategy="nullPrediction" splitCharacteristic="multiSplit">
					<MiningSchema>
						<MiningField name="temperature"/>
						<MiningField name="pressure"/>
						<MiningField name="wind"/>
					</MiningSchema>
					<Node>
						<True/>
						<Node>
							<SimplePredicate field="wind" operator="lessOrEqual" value="5.5"/>
							<Node>
								<SimplePredicate field="pressure" operator="lessOrEqual" value="983.5"/>
								<Node score="1" recordCount="2828.0">
									<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
									<ScoreDistribution value="1" recordCount="2540.0"/>
									<ScoreDistribution value="0" recordCount="288.0"/>
								</Node>
								<Node score="0" recordCount="924.0">
									<True/>
									<ScoreDistribution value="1" recordCount="249.0"/>
									<ScoreDistribution value="0" recordCount="675.0"/>
								</Node>
							</Node>
							<Node score="1" recordCount="7214.0">
								<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
								<ScoreDistribution value="1" recordCount="6414.0"/>
								<ScoreDistribution value="0" recordCount="800.0"/>
							</Node>
							<Node score="0" recordCount="2457.0">
								<True/>
								<ScoreDistribution value="1" recordCount="588.0"/>
								<ScoreDistribution value="0" recordCount="1869.0"/>
							</Node>
						</Node>
						<Node score="1" recordCount="109724.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="99210.0"/>
							<ScoreDistribution value="0" recordCount="10514.0"/>
						</Node>
						<Node score="0" recordCount="36312.0">
							<True/>
							<ScoreDistribution value="1" recordCount="9245.0"/>
							<ScoreDistribution value="0" recordCount="27067.0"/>
						</Node>
					</Node>
				</TreeModel>
			</Segment>
			<Segment id="6">
				<True/>
				<TreeModel functionName="classification" missingValueStrategy="nullPrediction" splitCharacteristic="multiSplit">
					<MiningSchema>
						<MiningField name="temperature"/>
					</MiningSchema>
					<Node>
						<True/>
						<Node score="1" recordCount="120743.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="108945.0"/>
							<ScoreDistribution value="0" recordCount="11798.0"/>
						</Node>
						<Node score="0" recordCount="39567.0">
							<True/>
							<ScoreDistribution value="1" recordCount="10013.0"/>
							<ScoreDistribution value="0" recordCount="29554.0"/>
						</Node>
					</Node>
				</TreeModel>
			</Segment>
			<Segment id="7">
				<True/>
				<TreeModel functionName="classification" missingValueStrategy="nullPrediction" splitCharacteristic="multiSplit">
					<MiningSchema>
						<MiningField name="temperature"/>
					</MiningSchema>
					<Node>
						<True/>
						<Node score="1" recordCount="120579.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="108592.0"/>
							<ScoreDistribution value="0" recordCount="11987.0"/>
						</Node>
						<Node score="0" recordCount="39137.0">
							<True/>
							<ScoreDistribution value="1" recordCount="9779.0"/>
							<ScoreDistribution value="0" recordCount="29358.0"/>
						</Node>
					</Node>
				</TreeModel>
			</Segment>
			<Segment id="8">
				<True/>
				<TreeModel functionName="classification" missingValueStrategy="nullPrediction" splitCharacteristic="multiSplit">
					<MiningSchema>
						<MiningField name="temperature"/>
					</MiningSchema>
					<Node>
						<True/>
						<Node score="1" recordCount="120594.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="108583.0"/>
							<ScoreDistribution value="0" recordCount="12011.0"/>
						</Node>
						<Node score="0" recordCount="39948.0">
							<True/>
							<ScoreDistribution value="1" recordCount="10122.0"/>
							<ScoreDistribution value="0" recordCount="29826.0"/>
						</Node>
					</Node>
				</TreeModel>
			</Segment>
			<Segment id="9">
				<True/>
				<TreeModel functionName="classification" missingValueStrategy="nullPrediction" splitCharacteristic="multiSplit">
					<MiningSchema>
						<MiningField name="temperature"/>
					</MiningSchema>
					<Node>
						<True/>
						<Node score="1" recordCount="120890.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="109109.0"/>
							<ScoreDistribution value="0" recordCount="11781.0"/>
						</Node>
						<Node score="0" recordCount="39577.0">
							<True/>
							<ScoreDistribution value="1" recordCount="10150.0"/>
							<ScoreDistribution value="0" recordCount="29427.0"/>
						</Node>
					</Node>
				</TreeModel>
			</Segment>
			<Segment id="10">
				<True/>
				<TreeModel functionName="classification" missingValueStrategy="nullPrediction" splitCharacteristic="multiSplit">
					<MiningSchema>
						<MiningField name="temperature"/>
					</MiningSchema>
					<Node>
						<True/>
						<Node score="1" recordCount="120524.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="108670.0"/>
							<ScoreDistribution value="0" recordCount="11854.0"/>
						</Node>
						<Node score="0" recordCount="39548.0">
							<True/>
							<ScoreDistribution value="1" recordCount="10139.0"/>
							<ScoreDistribution value="0" recordCount="29409.0"/>
						</Node>
					</Node>
				</TreeModel>
			</Segment>
			<Segment id="11">
				<True/>
				<TreeModel functionName="classification" missingValueStrategy="nullPrediction" splitCharacteristic="multiSplit">
					<MiningSchema>
						<MiningField name="temperature"/>
					</MiningSchema>
					<Node>
						<True/>
						<Node score="1" recordCount="119867.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="108077.0"/>
							<ScoreDistribution value="0" recordCount="11790.0"/>
						</Node>
						<Node score="0" recordCount="39518.0">
							<True/>
							<ScoreDistribution value="1" recordCount="10008.0"/>
							<ScoreDistribution value="0" recordCount="29510.0"/>
						</Node>
					</Node>
				</TreeModel>
			</Segment>
			<Segment id="12">
				<True/>
				<TreeModel functionName="classification" missingValueStrategy="nullPrediction" splitCharacteristic="multiSplit">
					<MiningSchema>
						<MiningField name="temperature"/>
					</MiningSchema>
					<Node>
						<True/>
						<Node score="1" recordCount="120041.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="108327.0"/>
							<ScoreDistribution value="0" recordCount="11714.0"/>
						</Node>
						<Node score="0" recordCount="39719.0">
							<True/>
							<ScoreDistribution value="1" recordCount="10033.0"/>
							<ScoreDistribution value="0" recordCount="29686.0"/>
						</Node>
					</Node>
				</TreeModel>
			</Segment>
			<Segment id="13">
				<True/>
				<TreeModel functionName="classification" missingValueStrategy="nullPrediction" splitCharacteristic="multiSplit">
					<MiningSchema>
						<MiningField name="temperature"/>
					</MiningSchema>
					<Node>
						<True/>
						<Node score="1" recordCount="120589.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="108587.0"/>
							<ScoreDistribution value="0" recordCount="12002.0"/>
						</Node>
						<Node score="0" recordCount="39957.0">
							<True/>
							<ScoreDistribution value="1" recordCount="9997.0"/>
							<ScoreDistribution value="0" recordCount="29960.0"/>
						</Node>
					</Node>
				</TreeModel>
			</Segment>
			<Segment id="14">
				<True/>
				<TreeModel functionName="classification" missingValueStrategy="nullPrediction" splitCharacteristic="multiSplit">
					<MiningSchema>
						<MiningField name="temperature"/>
					</MiningSchema>
					<Node>
						<True/>
						<Node score="1" recordCount="120514.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="108736.0"/>
							<ScoreDistribution value="0" recordCount="11778.0"/>
						</Node>
						<Node score="0" recordCount="39581.0">
							<True/>
							<ScoreDistribution value="1" recordCount="9980.0"/>
							<ScoreDistribution value="0" recordCount="29601.0"/>
						</Node>
					</Node>
				</TreeModel>
			</Segment>
			<Segment id="15">
				<True/>
				<TreeModel functionName="classification" missingValueStrategy="nullPrediction" splitCharacteristic="multiSplit">
					<MiningSchema>
						<MiningField name="temperature"/>
					</MiningSchema>
					<Node>
						<True/>
						<Node score="1" recordCount="120702.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="108957.0"/>
							<ScoreDistribution value="0" recordCount="11745.0"/>
						</Node>
						<Node score="0" recordCount="39222.0">
							<True/>
							<ScoreDistribution value="1" recordCount="9948.0"/>
							<ScoreDistribution value="0" recordCount="29274.0"/>
						</Node>
					</Node>
				</TreeModel>
			</Segment>
			<Segment id="16">
				<True/>
				<TreeModel functionName="classification" missingValueStrategy="nullPrediction" splitCharacteristic="multiSplit">
					<MiningSchema>
						<MiningField name="temperature"/>
					</MiningSchema>
					<Node>
						<True/>
						<Node score="1" recordCount="120444.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="108409.0"/>
							<ScoreDistribution value="0" recordCount="12035.0"/>
						</Node>
						<Node score="0" recordCount="39666.0">
							<True/>
							<ScoreDistribution value="1" recordCount="10176.0"/>
							<ScoreDistribution value="0" recordCount="29490.0"/>
						</Node>
					</Node>
				</TreeModel>
			</Segment>
			<Segment id="17">
				<True/>
				<TreeModel functionName="classification" missingValueStrategy="nullPrediction" splitCharacteristic="multiSplit">
					<MiningSchema>
						<MiningField name="temperature"/>
					</MiningSchema>
					<Node>
						<True/>
						<Node score="1" recordCount="120641.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="108688.0"/>
							<ScoreDistribution value="0" recordCount="11953.0"/>
						</Node>
						<Node score="0" recordCount="39615.0">
							<True/>
							<ScoreDistribution value="1" recordCount="9979.0"/>
							<ScoreDistribution value="0" recordCount="29636.0"/>
						</Node>
					</Node>
				</TreeModel>
			</Segment>
			<Segment id="18">
				<True/>
				<TreeModel functionName="classification" missingValueStrategy="nullPrediction" splitCharacteristic="multiSplit">
					<MiningSchema>
						<MiningField name="temperature"/>
						<MiningField name="wind"/>
					</MiningSchema>
					<Node>
						<True/>
						<Node>
							<SimplePredicate field="wind" operator="lessOrEqual" value="44.5"/>
							<Node score="1" recordCount="76560.0">
								<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
								<ScoreDistribution value="1" recordCount="69079.0"/>
								<ScoreDistribution value="0" recordCount="7481.0"/>
							</Node>
							<Node score="0" recordCount="25027.0">
								<True/>
								<ScoreDistribution value="1" recordCount="6377.0"/>
								<ScoreDistribution value="0" recordCount="18650.0"/>
							</Node>
						</Node>
						<Node score="1" recordCount="43919.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="39510.0"/>
							<ScoreDistribution value="0" recordCount="4409.0"/>
						</Node>
						<Node score="0" recordCount="14802.0">
							<True/>
							<ScoreDistribution value="1" recordCount="3725.0"/>
							<ScoreDistribution value="0" recordCount="11077.0"/>
						</Node>
					</Node>
				</TreeModel>
			</Segment>
			<Segment id="19">
				<True/>
				<TreeModel functionName="classification" missingValueStrategy="nullPrediction" splitCharacteristic="multiSplit">
					<MiningSchema>
						<MiningField name="temperature"/>
						<MiningField name="pressure"/>
					</MiningSchema>
					<Node>
						<True/>
						<Node>
							<SimplePredicate field="pressure" operator="lessOrEqual" value="1112.5"/>
							<Node score="1" recordCount="85832.0">
								<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
								<ScoreDistribution value="1" recordCount="77505.0"/>
								<ScoreDistribution value="0" recordCount="8327.0"/>
							</Node>
							<Node score="0" recordCount="27674.0">
								<True/>
								<ScoreDistribution value="1" recordCount="6962.0"/>
								<ScoreDistribution value="0" recordCount="20712.0"/>
							</Node>
						</Node>
						<Node score="1" recordCount="35202.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="31698.0"/>
							<ScoreDistribution value="0" recordCount="3504.0"/>
						</Node>
						<Node score="0" recordCount="11788.0">
							<True/>
							<ScoreDistribution value="1" recordCount="3005.0"/>
							<ScoreDistribution value="0" recordCount="8783.0"/>
						</Node>
					</Node>
				</TreeModel>
			</Segment>
			<Segment id="20">
				<True/>
				<TreeModel functionName="classification" missingValueStrategy="nullPrediction" splitCharacteristic="multiSplit">
					<MiningSchema>
						<MiningField name="temperature"/>
					</MiningSchema>
					<Node>
						<True/>
						<Node score="1" recordCount="119988.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="108087.0"/>
							<ScoreDistribution value="0" recordCount="11901.0"/>
						</Node>
						<Node score="0" recordCount="39450.0">
							<True/>
							<ScoreDistribution value="1" recordCount="9813.0"/>
							<ScoreDistribution value="0" recordCount="29637.0"/>
						</Node>
					</Node>
				</TreeModel>
			</Segment>
		</Segmentation>
	</MiningModel>
</PMML>
'), '2020-07-31 19:52:20.504');
INSERT INTO cdl_refit.models (project_guid, model_guid, model, timestamp) VALUES ('b6ee5bab-08dd-49b0-98b6-45cd0a28b12f', '__latest__', textAsBlob('<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<PMML xmlns="http://www.dmg.org/PMML-4_3" xmlns:data="http://jpmml.org/jpmml-model/InlineTable" version="4.3">
	<Header>
		<Application name="JPMML-SparkML" version="1.5.1"/>
		<Timestamp>2020-07-31T19:52:21Z</Timestamp>
	</Header>
	<DataDictionary>
		<DataField name="operable" optype="categorical" dataType="integer">
			<Value value="1"/>
			<Value value="0"/>
		</DataField>
		<DataField name="temperature" optype="continuous" dataType="double"/>
		<DataField name="pressure" optype="continuous" dataType="double"/>
		<DataField name="wind" optype="continuous" dataType="double"/>
	</DataDictionary>
	<MiningModel functionName="classification">
		<MiningSchema>
			<MiningField name="operable" usageType="target"/>
			<MiningField name="wind"/>
			<MiningField name="pressure"/>
			<MiningField name="temperature"/>
		</MiningSchema>
		<Output>
			<OutputField name="pmml(prediction)" optype="categorical" dataType="integer" feature="predictedValue"/>
			<OutputField name="prediction" optype="categorical" dataType="double" feature="transformedValue">
				<MapValues outputColumn="data:output">
					<FieldColumnPair field="pmml(prediction)" column="data:input"/>
					<InlineTable>
						<row>
							<data:input>1</data:input>
							<data:output>0</data:output>
						</row>
						<row>
							<data:input>0</data:input>
							<data:output>1</data:output>
						</row>
					</InlineTable>
				</MapValues>
			</OutputField>
			<OutputField name="probability(1)" optype="continuous" dataType="double" feature="probability" value="1"/>
			<OutputField name="probability(0)" optype="continuous" dataType="double" feature="probability" value="0"/>
		</Output>
		<Segmentation multipleModelMethod="average">
			<Segment id="1">
				<True/>
				<TreeModel functionName="classification" missingValueStrategy="nullPrediction" splitCharacteristic="multiSplit">
					<MiningSchema>
						<MiningField name="temperature"/>
					</MiningSchema>
					<Node>
						<True/>
						<Node score="1" recordCount="120610.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="108663.0"/>
							<ScoreDistribution value="0" recordCount="11947.0"/>
						</Node>
						<Node score="0" recordCount="39660.0">
							<True/>
							<ScoreDistribution value="1" recordCount="9941.0"/>
							<ScoreDistribution value="0" recordCount="29719.0"/>
						</Node>
					</Node>
				</TreeModel>
			</Segment>
			<Segment id="2">
				<True/>
				<TreeModel functionName="classification" missingValueStrategy="nullPrediction" splitCharacteristic="multiSplit">
					<MiningSchema>
						<MiningField name="temperature"/>
					</MiningSchema>
					<Node>
						<True/>
						<Node score="1" recordCount="120507.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="108620.0"/>
							<ScoreDistribution value="0" recordCount="11887.0"/>
						</Node>
						<Node score="0" recordCount="39941.0">
							<True/>
							<ScoreDistribution value="1" recordCount="10248.0"/>
							<ScoreDistribution value="0" recordCount="29693.0"/>
						</Node>
					</Node>
				</TreeModel>
			</Segment>
			<Segment id="3">
				<True/>
				<TreeModel functionName="classification" missingValueStrategy="nullPrediction" splitCharacteristic="multiSplit">
					<MiningSchema>
						<MiningField name="temperature"/>
					</MiningSchema>
					<Node>
						<True/>
						<Node score="1" recordCount="119736.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="108014.0"/>
							<ScoreDistribution value="0" recordCount="11722.0"/>
						</Node>
						<Node score="0" recordCount="39354.0">
							<True/>
							<ScoreDistribution value="1" recordCount="9939.0"/>
							<ScoreDistribution value="0" recordCount="29415.0"/>
						</Node>
					</Node>
				</TreeModel>
			</Segment>
			<Segment id="4">
				<True/>
				<TreeModel functionName="classification" missingValueStrategy="nullPrediction" splitCharacteristic="multiSplit">
					<MiningSchema>
						<MiningField name="temperature"/>
					</MiningSchema>
					<Node>
						<True/>
						<Node score="1" recordCount="121134.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="109293.0"/>
							<ScoreDistribution value="0" recordCount="11841.0"/>
						</Node>
						<Node score="0" recordCount="39695.0">
							<True/>
							<ScoreDistribution value="1" recordCount="10050.0"/>
							<ScoreDistribution value="0" recordCount="29645.0"/>
						</Node>
					</Node>
				</TreeModel>
			</Segment>
			<Segment id="5">
				<True/>
				<TreeModel functionName="classification" missingValueStrategy="nullPrediction" splitCharacteristic="multiSplit">
					<MiningSchema>
						<MiningField name="temperature"/>
						<MiningField name="pressure"/>
						<MiningField name="wind"/>
					</MiningSchema>
					<Node>
						<True/>
						<Node>
							<SimplePredicate field="wind" operator="lessOrEqual" value="5.5"/>
							<Node>
								<SimplePredicate field="pressure" operator="lessOrEqual" value="983.5"/>
								<Node score="1" recordCount="2828.0">
									<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
									<ScoreDistribution value="1" recordCount="2540.0"/>
									<ScoreDistribution value="0" recordCount="288.0"/>
								</Node>
								<Node score="0" recordCount="924.0">
									<True/>
									<ScoreDistribution value="1" recordCount="249.0"/>
									<ScoreDistribution value="0" recordCount="675.0"/>
								</Node>
							</Node>
							<Node score="1" recordCount="7214.0">
								<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
								<ScoreDistribution value="1" recordCount="6414.0"/>
								<ScoreDistribution value="0" recordCount="800.0"/>
							</Node>
							<Node score="0" recordCount="2457.0">
								<True/>
								<ScoreDistribution value="1" recordCount="588.0"/>
								<ScoreDistribution value="0" recordCount="1869.0"/>
							</Node>
						</Node>
						<Node score="1" recordCount="109724.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="99210.0"/>
							<ScoreDistribution value="0" recordCount="10514.0"/>
						</Node>
						<Node score="0" recordCount="36312.0">
							<True/>
							<ScoreDistribution value="1" recordCount="9245.0"/>
							<ScoreDistribution value="0" recordCount="27067.0"/>
						</Node>
					</Node>
				</TreeModel>
			</Segment>
			<Segment id="6">
				<True/>
				<TreeModel functionName="classification" missingValueStrategy="nullPrediction" splitCharacteristic="multiSplit">
					<MiningSchema>
						<MiningField name="temperature"/>
					</MiningSchema>
					<Node>
						<True/>
						<Node score="1" recordCount="120743.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="108945.0"/>
							<ScoreDistribution value="0" recordCount="11798.0"/>
						</Node>
						<Node score="0" recordCount="39567.0">
							<True/>
							<ScoreDistribution value="1" recordCount="10013.0"/>
							<ScoreDistribution value="0" recordCount="29554.0"/>
						</Node>
					</Node>
				</TreeModel>
			</Segment>
			<Segment id="7">
				<True/>
				<TreeModel functionName="classification" missingValueStrategy="nullPrediction" splitCharacteristic="multiSplit">
					<MiningSchema>
						<MiningField name="temperature"/>
					</MiningSchema>
					<Node>
						<True/>
						<Node score="1" recordCount="120579.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="108592.0"/>
							<ScoreDistribution value="0" recordCount="11987.0"/>
						</Node>
						<Node score="0" recordCount="39137.0">
							<True/>
							<ScoreDistribution value="1" recordCount="9779.0"/>
							<ScoreDistribution value="0" recordCount="29358.0"/>
						</Node>
					</Node>
				</TreeModel>
			</Segment>
			<Segment id="8">
				<True/>
				<TreeModel functionName="classification" missingValueStrategy="nullPrediction" splitCharacteristic="multiSplit">
					<MiningSchema>
						<MiningField name="temperature"/>
					</MiningSchema>
					<Node>
						<True/>
						<Node score="1" recordCount="120594.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="108583.0"/>
							<ScoreDistribution value="0" recordCount="12011.0"/>
						</Node>
						<Node score="0" recordCount="39948.0">
							<True/>
							<ScoreDistribution value="1" recordCount="10122.0"/>
							<ScoreDistribution value="0" recordCount="29826.0"/>
						</Node>
					</Node>
				</TreeModel>
			</Segment>
			<Segment id="9">
				<True/>
				<TreeModel functionName="classification" missingValueStrategy="nullPrediction" splitCharacteristic="multiSplit">
					<MiningSchema>
						<MiningField name="temperature"/>
					</MiningSchema>
					<Node>
						<True/>
						<Node score="1" recordCount="120890.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="109109.0"/>
							<ScoreDistribution value="0" recordCount="11781.0"/>
						</Node>
						<Node score="0" recordCount="39577.0">
							<True/>
							<ScoreDistribution value="1" recordCount="10150.0"/>
							<ScoreDistribution value="0" recordCount="29427.0"/>
						</Node>
					</Node>
				</TreeModel>
			</Segment>
			<Segment id="10">
				<True/>
				<TreeModel functionName="classification" missingValueStrategy="nullPrediction" splitCharacteristic="multiSplit">
					<MiningSchema>
						<MiningField name="temperature"/>
					</MiningSchema>
					<Node>
						<True/>
						<Node score="1" recordCount="120524.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="108670.0"/>
							<ScoreDistribution value="0" recordCount="11854.0"/>
						</Node>
						<Node score="0" recordCount="39548.0">
							<True/>
							<ScoreDistribution value="1" recordCount="10139.0"/>
							<ScoreDistribution value="0" recordCount="29409.0"/>
						</Node>
					</Node>
				</TreeModel>
			</Segment>
			<Segment id="11">
				<True/>
				<TreeModel functionName="classification" missingValueStrategy="nullPrediction" splitCharacteristic="multiSplit">
					<MiningSchema>
						<MiningField name="temperature"/>
					</MiningSchema>
					<Node>
						<True/>
						<Node score="1" recordCount="119867.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="108077.0"/>
							<ScoreDistribution value="0" recordCount="11790.0"/>
						</Node>
						<Node score="0" recordCount="39518.0">
							<True/>
							<ScoreDistribution value="1" recordCount="10008.0"/>
							<ScoreDistribution value="0" recordCount="29510.0"/>
						</Node>
					</Node>
				</TreeModel>
			</Segment>
			<Segment id="12">
				<True/>
				<TreeModel functionName="classification" missingValueStrategy="nullPrediction" splitCharacteristic="multiSplit">
					<MiningSchema>
						<MiningField name="temperature"/>
					</MiningSchema>
					<Node>
						<True/>
						<Node score="1" recordCount="120041.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="108327.0"/>
							<ScoreDistribution value="0" recordCount="11714.0"/>
						</Node>
						<Node score="0" recordCount="39719.0">
							<True/>
							<ScoreDistribution value="1" recordCount="10033.0"/>
							<ScoreDistribution value="0" recordCount="29686.0"/>
						</Node>
					</Node>
				</TreeModel>
			</Segment>
			<Segment id="13">
				<True/>
				<TreeModel functionName="classification" missingValueStrategy="nullPrediction" splitCharacteristic="multiSplit">
					<MiningSchema>
						<MiningField name="temperature"/>
					</MiningSchema>
					<Node>
						<True/>
						<Node score="1" recordCount="120589.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="108587.0"/>
							<ScoreDistribution value="0" recordCount="12002.0"/>
						</Node>
						<Node score="0" recordCount="39957.0">
							<True/>
							<ScoreDistribution value="1" recordCount="9997.0"/>
							<ScoreDistribution value="0" recordCount="29960.0"/>
						</Node>
					</Node>
				</TreeModel>
			</Segment>
			<Segment id="14">
				<True/>
				<TreeModel functionName="classification" missingValueStrategy="nullPrediction" splitCharacteristic="multiSplit">
					<MiningSchema>
						<MiningField name="temperature"/>
					</MiningSchema>
					<Node>
						<True/>
						<Node score="1" recordCount="120514.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="108736.0"/>
							<ScoreDistribution value="0" recordCount="11778.0"/>
						</Node>
						<Node score="0" recordCount="39581.0">
							<True/>
							<ScoreDistribution value="1" recordCount="9980.0"/>
							<ScoreDistribution value="0" recordCount="29601.0"/>
						</Node>
					</Node>
				</TreeModel>
			</Segment>
			<Segment id="15">
				<True/>
				<TreeModel functionName="classification" missingValueStrategy="nullPrediction" splitCharacteristic="multiSplit">
					<MiningSchema>
						<MiningField name="temperature"/>
					</MiningSchema>
					<Node>
						<True/>
						<Node score="1" recordCount="120702.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="108957.0"/>
							<ScoreDistribution value="0" recordCount="11745.0"/>
						</Node>
						<Node score="0" recordCount="39222.0">
							<True/>
							<ScoreDistribution value="1" recordCount="9948.0"/>
							<ScoreDistribution value="0" recordCount="29274.0"/>
						</Node>
					</Node>
				</TreeModel>
			</Segment>
			<Segment id="16">
				<True/>
				<TreeModel functionName="classification" missingValueStrategy="nullPrediction" splitCharacteristic="multiSplit">
					<MiningSchema>
						<MiningField name="temperature"/>
					</MiningSchema>
					<Node>
						<True/>
						<Node score="1" recordCount="120444.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="108409.0"/>
							<ScoreDistribution value="0" recordCount="12035.0"/>
						</Node>
						<Node score="0" recordCount="39666.0">
							<True/>
							<ScoreDistribution value="1" recordCount="10176.0"/>
							<ScoreDistribution value="0" recordCount="29490.0"/>
						</Node>
					</Node>
				</TreeModel>
			</Segment>
			<Segment id="17">
				<True/>
				<TreeModel functionName="classification" missingValueStrategy="nullPrediction" splitCharacteristic="multiSplit">
					<MiningSchema>
						<MiningField name="temperature"/>
					</MiningSchema>
					<Node>
						<True/>
						<Node score="1" recordCount="120641.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="108688.0"/>
							<ScoreDistribution value="0" recordCount="11953.0"/>
						</Node>
						<Node score="0" recordCount="39615.0">
							<True/>
							<ScoreDistribution value="1" recordCount="9979.0"/>
							<ScoreDistribution value="0" recordCount="29636.0"/>
						</Node>
					</Node>
				</TreeModel>
			</Segment>
			<Segment id="18">
				<True/>
				<TreeModel functionName="classification" missingValueStrategy="nullPrediction" splitCharacteristic="multiSplit">
					<MiningSchema>
						<MiningField name="temperature"/>
						<MiningField name="wind"/>
					</MiningSchema>
					<Node>
						<True/>
						<Node>
							<SimplePredicate field="wind" operator="lessOrEqual" value="44.5"/>
							<Node score="1" recordCount="76560.0">
								<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
								<ScoreDistribution value="1" recordCount="69079.0"/>
								<ScoreDistribution value="0" recordCount="7481.0"/>
							</Node>
							<Node score="0" recordCount="25027.0">
								<True/>
								<ScoreDistribution value="1" recordCount="6377.0"/>
								<ScoreDistribution value="0" recordCount="18650.0"/>
							</Node>
						</Node>
						<Node score="1" recordCount="43919.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="39510.0"/>
							<ScoreDistribution value="0" recordCount="4409.0"/>
						</Node>
						<Node score="0" recordCount="14802.0">
							<True/>
							<ScoreDistribution value="1" recordCount="3725.0"/>
							<ScoreDistribution value="0" recordCount="11077.0"/>
						</Node>
					</Node>
				</TreeModel>
			</Segment>
			<Segment id="19">
				<True/>
				<TreeModel functionName="classification" missingValueStrategy="nullPrediction" splitCharacteristic="multiSplit">
					<MiningSchema>
						<MiningField name="temperature"/>
						<MiningField name="pressure"/>
					</MiningSchema>
					<Node>
						<True/>
						<Node>
							<SimplePredicate field="pressure" operator="lessOrEqual" value="1112.5"/>
							<Node score="1" recordCount="85832.0">
								<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
								<ScoreDistribution value="1" recordCount="77505.0"/>
								<ScoreDistribution value="0" recordCount="8327.0"/>
							</Node>
							<Node score="0" recordCount="27674.0">
								<True/>
								<ScoreDistribution value="1" recordCount="6962.0"/>
								<ScoreDistribution value="0" recordCount="20712.0"/>
							</Node>
						</Node>
						<Node score="1" recordCount="35202.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="31698.0"/>
							<ScoreDistribution value="0" recordCount="3504.0"/>
						</Node>
						<Node score="0" recordCount="11788.0">
							<True/>
							<ScoreDistribution value="1" recordCount="3005.0"/>
							<ScoreDistribution value="0" recordCount="8783.0"/>
						</Node>
					</Node>
				</TreeModel>
			</Segment>
			<Segment id="20">
				<True/>
				<TreeModel functionName="classification" missingValueStrategy="nullPrediction" splitCharacteristic="multiSplit">
					<MiningSchema>
						<MiningField name="temperature"/>
					</MiningSchema>
					<Node>
						<True/>
						<Node score="1" recordCount="119988.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="108087.0"/>
							<ScoreDistribution value="0" recordCount="11901.0"/>
						</Node>
						<Node score="0" recordCount="39450.0">
							<True/>
							<ScoreDistribution value="1" recordCount="9813.0"/>
							<ScoreDistribution value="0" recordCount="29637.0"/>
						</Node>
					</Node>
				</TreeModel>
			</Segment>
		</Segmentation>
	</MiningModel>
</PMML>
'), '2020-07-31 19:52:20.504');