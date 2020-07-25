INSERT INTO iot_prototype_training.models (key, model) VALUES ('__latest__', textAsBlob('<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<PMML xmlns="http://www.dmg.org/PMML-4_3" xmlns:data="http://jpmml.org/jpmml-model/InlineTable" version="4.3">
	<Header>
		<Application name="JPMML-SparkML" version="1.5.1"/>
		<Timestamp>2020-07-25T03:00:18Z</Timestamp>
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
			<MiningField name="temperature"/>
			<MiningField name="pressure"/>
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
							<ScoreDistribution value="1" recordCount="108661.0"/>
							<ScoreDistribution value="0" recordCount="11949.0"/>
						</Node>
						<Node score="0" recordCount="39660.0">
							<True/>
							<ScoreDistribution value="1" recordCount="9940.0"/>
							<ScoreDistribution value="0" recordCount="29720.0"/>
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
							<ScoreDistribution value="1" recordCount="108616.0"/>
							<ScoreDistribution value="0" recordCount="11891.0"/>
						</Node>
						<Node score="0" recordCount="39941.0">
							<True/>
							<ScoreDistribution value="1" recordCount="10247.0"/>
							<ScoreDistribution value="0" recordCount="29694.0"/>
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
							<ScoreDistribution value="1" recordCount="108012.0"/>
							<ScoreDistribution value="0" recordCount="11724.0"/>
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
							<ScoreDistribution value="1" recordCount="109292.0"/>
							<ScoreDistribution value="0" recordCount="11842.0"/>
						</Node>
						<Node score="0" recordCount="39695.0">
							<True/>
							<ScoreDistribution value="1" recordCount="10048.0"/>
							<ScoreDistribution value="0" recordCount="29647.0"/>
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
							<SimplePredicate field="pressure" operator="lessOrEqual" value="954.5"/>
							<Node>
								<SimplePredicate field="wind" operator="lessOrEqual" value="54.5"/>
								<Node score="1" recordCount="16811.0">
									<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
									<ScoreDistribution value="1" recordCount="15197.0"/>
									<ScoreDistribution value="0" recordCount="1614.0"/>
								</Node>
								<Node score="0" recordCount="5831.0">
									<True/>
									<ScoreDistribution value="1" recordCount="1463.0"/>
									<ScoreDistribution value="0" recordCount="4368.0"/>
								</Node>
							</Node>
							<Node score="1" recordCount="4975.0">
								<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
								<ScoreDistribution value="1" recordCount="4435.0"/>
								<ScoreDistribution value="0" recordCount="540.0"/>
							</Node>
							<Node score="0" recordCount="1704.0">
								<True/>
								<ScoreDistribution value="1" recordCount="389.0"/>
								<ScoreDistribution value="0" recordCount="1315.0"/>
							</Node>
						</Node>
						<Node score="1" recordCount="97980.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="88530.0"/>
							<ScoreDistribution value="0" recordCount="9450.0"/>
						</Node>
						<Node score="0" recordCount="32158.0">
							<True/>
							<ScoreDistribution value="1" recordCount="8229.0"/>
							<ScoreDistribution value="0" recordCount="23929.0"/>
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
							<ScoreDistribution value="1" recordCount="108942.0"/>
							<ScoreDistribution value="0" recordCount="11801.0"/>
						</Node>
						<Node score="0" recordCount="39567.0">
							<True/>
							<ScoreDistribution value="1" recordCount="10011.0"/>
							<ScoreDistribution value="0" recordCount="29556.0"/>
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
							<ScoreDistribution value="1" recordCount="108591.0"/>
							<ScoreDistribution value="0" recordCount="11988.0"/>
						</Node>
						<Node score="0" recordCount="39137.0">
							<True/>
							<ScoreDistribution value="1" recordCount="9777.0"/>
							<ScoreDistribution value="0" recordCount="29360.0"/>
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
							<ScoreDistribution value="1" recordCount="108581.0"/>
							<ScoreDistribution value="0" recordCount="12013.0"/>
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
							<ScoreDistribution value="1" recordCount="109107.0"/>
							<ScoreDistribution value="0" recordCount="11783.0"/>
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
							<ScoreDistribution value="1" recordCount="108076.0"/>
							<ScoreDistribution value="0" recordCount="11791.0"/>
						</Node>
						<Node score="0" recordCount="39518.0">
							<True/>
							<ScoreDistribution value="1" recordCount="10007.0"/>
							<ScoreDistribution value="0" recordCount="29511.0"/>
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
							<ScoreDistribution value="1" recordCount="108323.0"/>
							<ScoreDistribution value="0" recordCount="11718.0"/>
						</Node>
						<Node score="0" recordCount="39719.0">
							<True/>
							<ScoreDistribution value="1" recordCount="10031.0"/>
							<ScoreDistribution value="0" recordCount="29688.0"/>
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
							<ScoreDistribution value="1" recordCount="108584.0"/>
							<ScoreDistribution value="0" recordCount="12005.0"/>
						</Node>
						<Node score="0" recordCount="39957.0">
							<True/>
							<ScoreDistribution value="1" recordCount="9996.0"/>
							<ScoreDistribution value="0" recordCount="29961.0"/>
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
							<ScoreDistribution value="1" recordCount="108956.0"/>
							<ScoreDistribution value="0" recordCount="11746.0"/>
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
							<ScoreDistribution value="1" recordCount="108408.0"/>
							<ScoreDistribution value="0" recordCount="12036.0"/>
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
							<ScoreDistribution value="1" recordCount="108686.0"/>
							<ScoreDistribution value="0" recordCount="11955.0"/>
						</Node>
						<Node score="0" recordCount="39615.0">
							<True/>
							<ScoreDistribution value="1" recordCount="9978.0"/>
							<ScoreDistribution value="0" recordCount="29637.0"/>
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
							<SimplePredicate field="wind" operator="lessOrEqual" value="14.5"/>
							<Node score="1" recordCount="25385.0">
								<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
								<ScoreDistribution value="1" recordCount="22784.0"/>
								<ScoreDistribution value="0" recordCount="2601.0"/>
							</Node>
							<Node score="0" recordCount="8396.0">
								<True/>
								<ScoreDistribution value="1" recordCount="1972.0"/>
								<ScoreDistribution value="0" recordCount="6424.0"/>
							</Node>
						</Node>
						<Node score="1" recordCount="95094.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="85801.0"/>
							<ScoreDistribution value="0" recordCount="9293.0"/>
						</Node>
						<Node score="0" recordCount="31433.0">
							<True/>
							<ScoreDistribution value="1" recordCount="8129.0"/>
							<ScoreDistribution value="0" recordCount="23304.0"/>
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
							<Node score="1" recordCount="86071.0">
								<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
								<ScoreDistribution value="1" recordCount="77724.0"/>
								<ScoreDistribution value="0" recordCount="8347.0"/>
							</Node>
							<Node score="0" recordCount="27817.0">
								<True/>
								<ScoreDistribution value="1" recordCount="7041.0"/>
								<ScoreDistribution value="0" recordCount="20776.0"/>
							</Node>
						</Node>
						<Node score="1" recordCount="34963.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="31477.0"/>
							<ScoreDistribution value="0" recordCount="3486.0"/>
						</Node>
						<Node score="0" recordCount="11645.0">
							<True/>
							<ScoreDistribution value="1" recordCount="2926.0"/>
							<ScoreDistribution value="0" recordCount="8719.0"/>
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
							<ScoreDistribution value="1" recordCount="108085.0"/>
							<ScoreDistribution value="0" recordCount="11903.0"/>
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
'));
INSERT INTO iot_prototype_training.models (key, model) VALUES ('d6b75b2b-f0f1-4dcc-8e5b-e8fe1fff3629', textAsBlob('<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<PMML xmlns="http://www.dmg.org/PMML-4_3" xmlns:data="http://jpmml.org/jpmml-model/InlineTable" version="4.3">
	<Header>
		<Application name="JPMML-SparkML" version="1.5.1"/>
		<Timestamp>2020-07-25T03:00:18Z</Timestamp>
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
			<MiningField name="temperature"/>
			<MiningField name="pressure"/>
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
							<ScoreDistribution value="1" recordCount="108661.0"/>
							<ScoreDistribution value="0" recordCount="11949.0"/>
						</Node>
						<Node score="0" recordCount="39660.0">
							<True/>
							<ScoreDistribution value="1" recordCount="9940.0"/>
							<ScoreDistribution value="0" recordCount="29720.0"/>
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
							<ScoreDistribution value="1" recordCount="108616.0"/>
							<ScoreDistribution value="0" recordCount="11891.0"/>
						</Node>
						<Node score="0" recordCount="39941.0">
							<True/>
							<ScoreDistribution value="1" recordCount="10247.0"/>
							<ScoreDistribution value="0" recordCount="29694.0"/>
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
							<ScoreDistribution value="1" recordCount="108012.0"/>
							<ScoreDistribution value="0" recordCount="11724.0"/>
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
							<ScoreDistribution value="1" recordCount="109292.0"/>
							<ScoreDistribution value="0" recordCount="11842.0"/>
						</Node>
						<Node score="0" recordCount="39695.0">
							<True/>
							<ScoreDistribution value="1" recordCount="10048.0"/>
							<ScoreDistribution value="0" recordCount="29647.0"/>
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
							<SimplePredicate field="pressure" operator="lessOrEqual" value="954.5"/>
							<Node>
								<SimplePredicate field="wind" operator="lessOrEqual" value="54.5"/>
								<Node score="1" recordCount="16811.0">
									<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
									<ScoreDistribution value="1" recordCount="15197.0"/>
									<ScoreDistribution value="0" recordCount="1614.0"/>
								</Node>
								<Node score="0" recordCount="5831.0">
									<True/>
									<ScoreDistribution value="1" recordCount="1463.0"/>
									<ScoreDistribution value="0" recordCount="4368.0"/>
								</Node>
							</Node>
							<Node score="1" recordCount="4975.0">
								<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
								<ScoreDistribution value="1" recordCount="4435.0"/>
								<ScoreDistribution value="0" recordCount="540.0"/>
							</Node>
							<Node score="0" recordCount="1704.0">
								<True/>
								<ScoreDistribution value="1" recordCount="389.0"/>
								<ScoreDistribution value="0" recordCount="1315.0"/>
							</Node>
						</Node>
						<Node score="1" recordCount="97980.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="88530.0"/>
							<ScoreDistribution value="0" recordCount="9450.0"/>
						</Node>
						<Node score="0" recordCount="32158.0">
							<True/>
							<ScoreDistribution value="1" recordCount="8229.0"/>
							<ScoreDistribution value="0" recordCount="23929.0"/>
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
							<ScoreDistribution value="1" recordCount="108942.0"/>
							<ScoreDistribution value="0" recordCount="11801.0"/>
						</Node>
						<Node score="0" recordCount="39567.0">
							<True/>
							<ScoreDistribution value="1" recordCount="10011.0"/>
							<ScoreDistribution value="0" recordCount="29556.0"/>
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
							<ScoreDistribution value="1" recordCount="108591.0"/>
							<ScoreDistribution value="0" recordCount="11988.0"/>
						</Node>
						<Node score="0" recordCount="39137.0">
							<True/>
							<ScoreDistribution value="1" recordCount="9777.0"/>
							<ScoreDistribution value="0" recordCount="29360.0"/>
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
							<ScoreDistribution value="1" recordCount="108581.0"/>
							<ScoreDistribution value="0" recordCount="12013.0"/>
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
							<ScoreDistribution value="1" recordCount="109107.0"/>
							<ScoreDistribution value="0" recordCount="11783.0"/>
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
							<ScoreDistribution value="1" recordCount="108076.0"/>
							<ScoreDistribution value="0" recordCount="11791.0"/>
						</Node>
						<Node score="0" recordCount="39518.0">
							<True/>
							<ScoreDistribution value="1" recordCount="10007.0"/>
							<ScoreDistribution value="0" recordCount="29511.0"/>
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
							<ScoreDistribution value="1" recordCount="108323.0"/>
							<ScoreDistribution value="0" recordCount="11718.0"/>
						</Node>
						<Node score="0" recordCount="39719.0">
							<True/>
							<ScoreDistribution value="1" recordCount="10031.0"/>
							<ScoreDistribution value="0" recordCount="29688.0"/>
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
							<ScoreDistribution value="1" recordCount="108584.0"/>
							<ScoreDistribution value="0" recordCount="12005.0"/>
						</Node>
						<Node score="0" recordCount="39957.0">
							<True/>
							<ScoreDistribution value="1" recordCount="9996.0"/>
							<ScoreDistribution value="0" recordCount="29961.0"/>
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
							<ScoreDistribution value="1" recordCount="108956.0"/>
							<ScoreDistribution value="0" recordCount="11746.0"/>
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
							<ScoreDistribution value="1" recordCount="108408.0"/>
							<ScoreDistribution value="0" recordCount="12036.0"/>
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
							<ScoreDistribution value="1" recordCount="108686.0"/>
							<ScoreDistribution value="0" recordCount="11955.0"/>
						</Node>
						<Node score="0" recordCount="39615.0">
							<True/>
							<ScoreDistribution value="1" recordCount="9978.0"/>
							<ScoreDistribution value="0" recordCount="29637.0"/>
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
							<SimplePredicate field="wind" operator="lessOrEqual" value="14.5"/>
							<Node score="1" recordCount="25385.0">
								<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
								<ScoreDistribution value="1" recordCount="22784.0"/>
								<ScoreDistribution value="0" recordCount="2601.0"/>
							</Node>
							<Node score="0" recordCount="8396.0">
								<True/>
								<ScoreDistribution value="1" recordCount="1972.0"/>
								<ScoreDistribution value="0" recordCount="6424.0"/>
							</Node>
						</Node>
						<Node score="1" recordCount="95094.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="85801.0"/>
							<ScoreDistribution value="0" recordCount="9293.0"/>
						</Node>
						<Node score="0" recordCount="31433.0">
							<True/>
							<ScoreDistribution value="1" recordCount="8129.0"/>
							<ScoreDistribution value="0" recordCount="23304.0"/>
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
							<Node score="1" recordCount="86071.0">
								<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
								<ScoreDistribution value="1" recordCount="77724.0"/>
								<ScoreDistribution value="0" recordCount="8347.0"/>
							</Node>
							<Node score="0" recordCount="27817.0">
								<True/>
								<ScoreDistribution value="1" recordCount="7041.0"/>
								<ScoreDistribution value="0" recordCount="20776.0"/>
							</Node>
						</Node>
						<Node score="1" recordCount="34963.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="31477.0"/>
							<ScoreDistribution value="0" recordCount="3486.0"/>
						</Node>
						<Node score="0" recordCount="11645.0">
							<True/>
							<ScoreDistribution value="1" recordCount="2926.0"/>
							<ScoreDistribution value="0" recordCount="8719.0"/>
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
							<ScoreDistribution value="1" recordCount="108085.0"/>
							<ScoreDistribution value="0" recordCount="11903.0"/>
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
'));