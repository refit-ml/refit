INSERT INTO iot_prototype_training.models (key, model) VALUES ('3eac62a6-c3b7-4ef6-a92f-d527d4563de2', textAsBlob('<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<PMML xmlns="http://www.dmg.org/PMML-4_3" xmlns:data="http://jpmml.org/jpmml-model/InlineTable" version="4.3">
	<Header>
		<Application name="JPMML-SparkML" version="1.5.1"/>
		<Timestamp>2020-07-26T04:14:18Z</Timestamp>
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
			<MiningField name="temperature"/>
			<MiningField name="wind"/>
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
							<SimplePredicate field="pressure" operator="lessOrEqual" value="962.5"/>
							<Node>
								<SimplePredicate field="wind" operator="lessOrEqual" value="53.5"/>
								<Node score="1" recordCount="19065.0">
									<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
									<ScoreDistribution value="1" recordCount="17222.0"/>
									<ScoreDistribution value="0" recordCount="1843.0"/>
								</Node>
								<Node score="0" recordCount="6454.0">
									<True/>
									<ScoreDistribution value="1" recordCount="1602.0"/>
									<ScoreDistribution value="0" recordCount="4852.0"/>
								</Node>
							</Node>
							<Node score="1" recordCount="5980.0">
								<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
								<ScoreDistribution value="1" recordCount="5337.0"/>
								<ScoreDistribution value="0" recordCount="643.0"/>
							</Node>
							<Node score="0" recordCount="2093.0">
								<True/>
								<ScoreDistribution value="1" recordCount="479.0"/>
								<ScoreDistribution value="0" recordCount="1614.0"/>
							</Node>
						</Node>
						<Node score="1" recordCount="94721.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="85603.0"/>
							<ScoreDistribution value="0" recordCount="9118.0"/>
						</Node>
						<Node score="0" recordCount="31146.0">
							<True/>
							<ScoreDistribution value="1" recordCount="8000.0"/>
							<ScoreDistribution value="0" recordCount="23146.0"/>
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
						<MiningField name="pressure"/>
					</MiningSchema>
					<Node>
						<True/>
						<Node>
							<SimplePredicate field="pressure" operator="lessOrEqual" value="1161.5"/>
							<Node score="1" recordCount="105127.0">
								<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
								<ScoreDistribution value="1" recordCount="94876.0"/>
								<ScoreDistribution value="0" recordCount="10251.0"/>
							</Node>
							<Node score="0" recordCount="34592.0">
								<True/>
								<ScoreDistribution value="1" recordCount="8772.0"/>
								<ScoreDistribution value="0" recordCount="25820.0"/>
							</Node>
						</Node>
						<Node score="1" recordCount="15352.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="13709.0"/>
							<ScoreDistribution value="0" recordCount="1643.0"/>
						</Node>
						<Node score="0" recordCount="5237.0">
							<True/>
							<ScoreDistribution value="1" recordCount="1329.0"/>
							<ScoreDistribution value="0" recordCount="3908.0"/>
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
							<SimplePredicate field="pressure" operator="lessOrEqual" value="1068.5"/>
							<Node score="1" recordCount="67748.0">
								<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
								<ScoreDistribution value="1" recordCount="61000.0"/>
								<ScoreDistribution value="0" recordCount="6748.0"/>
							</Node>
							<Node score="0" recordCount="22118.0">
								<True/>
								<ScoreDistribution value="1" recordCount="5448.0"/>
								<ScoreDistribution value="0" recordCount="16670.0"/>
							</Node>
						</Node>
						<Node score="1" recordCount="53286.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="48201.0"/>
							<ScoreDistribution value="0" recordCount="5085.0"/>
						</Node>
						<Node score="0" recordCount="17344.0">
							<True/>
							<ScoreDistribution value="1" recordCount="4519.0"/>
							<ScoreDistribution value="0" recordCount="12825.0"/>
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
INSERT INTO iot_prototype_training.models (key, model) VALUES ('__latest__', textAsBlob('<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<PMML xmlns="http://www.dmg.org/PMML-4_3" xmlns:data="http://jpmml.org/jpmml-model/InlineTable" version="4.3">
	<Header>
		<Application name="JPMML-SparkML" version="1.5.1"/>
		<Timestamp>2020-07-26T18:46:40Z</Timestamp>
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
							<SimplePredicate field="pressure" operator="lessOrEqual" value="955.5"/>
							<Node>
								<SimplePredicate field="wind" operator="lessOrEqual" value="32.5"/>
								<Node score="1" recordCount="10325.0">
									<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
									<ScoreDistribution value="1" recordCount="9334.0"/>
									<ScoreDistribution value="0" recordCount="991.0"/>
								</Node>
								<Node score="0" recordCount="3421.0">
									<True/>
									<ScoreDistribution value="1" recordCount="860.0"/>
									<ScoreDistribution value="0" recordCount="2561.0"/>
								</Node>
							</Node>
							<Node score="1" recordCount="11899.0">
								<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
								<ScoreDistribution value="1" recordCount="10665.0"/>
								<ScoreDistribution value="0" recordCount="1234.0"/>
							</Node>
							<Node score="0" recordCount="4107.0">
								<True/>
								<ScoreDistribution value="1" recordCount="973.0"/>
								<ScoreDistribution value="0" recordCount="3134.0"/>
							</Node>
						</Node>
						<Node score="1" recordCount="97542.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="88163.0"/>
							<ScoreDistribution value="0" recordCount="9379.0"/>
						</Node>
						<Node score="0" recordCount="32165.0">
							<True/>
							<ScoreDistribution value="1" recordCount="8248.0"/>
							<ScoreDistribution value="0" recordCount="23917.0"/>
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
						<MiningField name="pressure"/>
					</MiningSchema>
					<Node>
						<True/>
						<Node>
							<SimplePredicate field="pressure" operator="lessOrEqual" value="916.5"/>
							<Node score="1" recordCount="6989.0">
								<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
								<ScoreDistribution value="1" recordCount="6340.0"/>
								<ScoreDistribution value="0" recordCount="649.0"/>
							</Node>
							<Node score="0" recordCount="2234.0">
								<True/>
								<ScoreDistribution value="1" recordCount="606.0"/>
								<ScoreDistribution value="0" recordCount="1628.0"/>
							</Node>
						</Node>
						<Node score="1" recordCount="113490.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="102245.0"/>
							<ScoreDistribution value="0" recordCount="11245.0"/>
						</Node>
						<Node score="0" recordCount="37595.0">
							<True/>
							<ScoreDistribution value="1" recordCount="9495.0"/>
							<ScoreDistribution value="0" recordCount="28100.0"/>
						</Node>
					</Node>
				</TreeModel>
			</Segment>
			<Segment id="19">
				<True/>
				<TreeModel functionName="classification" missingValueStrategy="nullPrediction" splitCharacteristic="multiSplit">
					<MiningSchema>
						<MiningField name="temperature"/>
						<MiningField name="wind"/>
					</MiningSchema>
					<Node>
						<True/>
						<Node>
							<SimplePredicate field="wind" operator="lessOrEqual" value="63.5"/>
							<Node score="1" recordCount="108884.0">
								<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
								<ScoreDistribution value="1" recordCount="98227.0"/>
								<ScoreDistribution value="0" recordCount="10657.0"/>
							</Node>
							<Node score="0" recordCount="35687.0">
								<True/>
								<ScoreDistribution value="1" recordCount="8997.0"/>
								<ScoreDistribution value="0" recordCount="26690.0"/>
							</Node>
						</Node>
						<Node score="1" recordCount="12150.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="10974.0"/>
							<ScoreDistribution value="0" recordCount="1176.0"/>
						</Node>
						<Node score="0" recordCount="3775.0">
							<True/>
							<ScoreDistribution value="1" recordCount="970.0"/>
							<ScoreDistribution value="0" recordCount="2805.0"/>
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
INSERT INTO iot_prototype_training.models (key, model) VALUES ('c51b95ba-2639-49ff-8874-b160e3ebec44', textAsBlob('<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<PMML xmlns="http://www.dmg.org/PMML-4_3" xmlns:data="http://jpmml.org/jpmml-model/InlineTable" version="4.3">
	<Header>
		<Application name="JPMML-SparkML" version="1.5.1"/>
		<Timestamp>2020-07-26T05:09:37Z</Timestamp>
	</Header>
	<DataDictionary>
		<DataField name="operable" optype="categorical" dataType="integer">
			<Value value="1"/>
			<Value value="0"/>
		</DataField>
		<DataField name="temperature" optype="continuous" dataType="double"/>
		<DataField name="wind" optype="continuous" dataType="double"/>
	</DataDictionary>
	<MiningModel functionName="classification">
		<MiningSchema>
			<MiningField name="operable" usageType="target"/>
			<MiningField name="temperature"/>
			<MiningField name="wind"/>
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
						<MiningField name="wind"/>
					</MiningSchema>
					<Node>
						<True/>
						<Node>
							<SimplePredicate field="wind" operator="lessOrEqual" value="41.5"/>
							<Node>
								<SimplePredicate field="wind" operator="lessOrEqual" value="17.5"/>
								<Node score="1" recordCount="30281.0">
									<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
									<ScoreDistribution value="1" recordCount="27254.0"/>
									<ScoreDistribution value="0" recordCount="3027.0"/>
								</Node>
								<Node score="0" recordCount="9920.0">
									<True/>
									<ScoreDistribution value="1" recordCount="2491.0"/>
									<ScoreDistribution value="0" recordCount="7429.0"/>
								</Node>
							</Node>
							<Node score="1" recordCount="40605.0">
								<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
								<ScoreDistribution value="1" recordCount="36731.0"/>
								<ScoreDistribution value="0" recordCount="3874.0"/>
							</Node>
							<Node score="0" recordCount="13103.0">
								<True/>
								<ScoreDistribution value="1" recordCount="3432.0"/>
								<ScoreDistribution value="0" recordCount="9671.0"/>
							</Node>
						</Node>
						<Node score="1" recordCount="48880.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="44177.0"/>
							<ScoreDistribution value="0" recordCount="4703.0"/>
						</Node>
						<Node score="0" recordCount="16670.0">
							<True/>
							<ScoreDistribution value="1" recordCount="4158.0"/>
							<ScoreDistribution value="0" recordCount="12512.0"/>
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
							<SimplePredicate field="wind" operator="lessOrEqual" value="52.5"/>
							<Node score="1" recordCount="90112.0">
								<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
								<ScoreDistribution value="1" recordCount="81255.0"/>
								<ScoreDistribution value="0" recordCount="8857.0"/>
							</Node>
							<Node score="0" recordCount="29472.0">
								<True/>
								<ScoreDistribution value="1" recordCount="7470.0"/>
								<ScoreDistribution value="0" recordCount="22002.0"/>
							</Node>
						</Node>
						<Node score="1" recordCount="30367.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="27330.0"/>
							<ScoreDistribution value="0" recordCount="3037.0"/>
						</Node>
						<Node score="0" recordCount="10357.0">
							<True/>
							<ScoreDistribution value="1" recordCount="2631.0"/>
							<ScoreDistribution value="0" recordCount="7726.0"/>
						</Node>
					</Node>
				</TreeModel>
			</Segment>
			<Segment id="19">
				<True/>
				<TreeModel functionName="classification" missingValueStrategy="nullPrediction" splitCharacteristic="multiSplit">
					<MiningSchema>
						<MiningField name="temperature"/>
						<MiningField name="wind"/>
					</MiningSchema>
					<Node>
						<True/>
						<Node>
							<SimplePredicate field="wind" operator="lessOrEqual" value="63.5"/>
							<Node score="1" recordCount="108837.0">
								<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
								<ScoreDistribution value="1" recordCount="98170.0"/>
								<ScoreDistribution value="0" recordCount="10667.0"/>
							</Node>
							<Node score="0" recordCount="35729.0">
								<True/>
								<ScoreDistribution value="1" recordCount="9021.0"/>
								<ScoreDistribution value="0" recordCount="26708.0"/>
							</Node>
						</Node>
						<Node score="1" recordCount="12197.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="11031.0"/>
							<ScoreDistribution value="0" recordCount="1166.0"/>
						</Node>
						<Node score="0" recordCount="3733.0">
							<True/>
							<ScoreDistribution value="1" recordCount="946.0"/>
							<ScoreDistribution value="0" recordCount="2787.0"/>
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
INSERT INTO iot_prototype_training.models (key, model) VALUES ('e48b9975-b013-4d70-9618-208de8cd36a3', textAsBlob('<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<PMML xmlns="http://www.dmg.org/PMML-4_3" xmlns:data="http://jpmml.org/jpmml-model/InlineTable" version="4.3">
	<Header>
		<Application name="JPMML-SparkML" version="1.5.1"/>
		<Timestamp>2020-07-26T03:04:55Z</Timestamp>
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
							<SimplePredicate field="pressure" operator="lessOrEqual" value="962.5"/>
							<Node>
								<SimplePredicate field="wind" operator="lessOrEqual" value="53.5"/>
								<Node score="1" recordCount="19065.0">
									<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
									<ScoreDistribution value="1" recordCount="17222.0"/>
									<ScoreDistribution value="0" recordCount="1843.0"/>
								</Node>
								<Node score="0" recordCount="6454.0">
									<True/>
									<ScoreDistribution value="1" recordCount="1602.0"/>
									<ScoreDistribution value="0" recordCount="4852.0"/>
								</Node>
							</Node>
							<Node score="1" recordCount="5980.0">
								<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
								<ScoreDistribution value="1" recordCount="5337.0"/>
								<ScoreDistribution value="0" recordCount="643.0"/>
							</Node>
							<Node score="0" recordCount="2093.0">
								<True/>
								<ScoreDistribution value="1" recordCount="479.0"/>
								<ScoreDistribution value="0" recordCount="1614.0"/>
							</Node>
						</Node>
						<Node score="1" recordCount="94721.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="85603.0"/>
							<ScoreDistribution value="0" recordCount="9118.0"/>
						</Node>
						<Node score="0" recordCount="31146.0">
							<True/>
							<ScoreDistribution value="1" recordCount="8000.0"/>
							<ScoreDistribution value="0" recordCount="23146.0"/>
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
						<MiningField name="pressure"/>
					</MiningSchema>
					<Node>
						<True/>
						<Node>
							<SimplePredicate field="pressure" operator="lessOrEqual" value="1161.5"/>
							<Node score="1" recordCount="105127.0">
								<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
								<ScoreDistribution value="1" recordCount="94876.0"/>
								<ScoreDistribution value="0" recordCount="10251.0"/>
							</Node>
							<Node score="0" recordCount="34592.0">
								<True/>
								<ScoreDistribution value="1" recordCount="8772.0"/>
								<ScoreDistribution value="0" recordCount="25820.0"/>
							</Node>
						</Node>
						<Node score="1" recordCount="15352.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="13709.0"/>
							<ScoreDistribution value="0" recordCount="1643.0"/>
						</Node>
						<Node score="0" recordCount="5237.0">
							<True/>
							<ScoreDistribution value="1" recordCount="1329.0"/>
							<ScoreDistribution value="0" recordCount="3908.0"/>
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
							<SimplePredicate field="pressure" operator="lessOrEqual" value="1068.5"/>
							<Node score="1" recordCount="67748.0">
								<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
								<ScoreDistribution value="1" recordCount="61000.0"/>
								<ScoreDistribution value="0" recordCount="6748.0"/>
							</Node>
							<Node score="0" recordCount="22118.0">
								<True/>
								<ScoreDistribution value="1" recordCount="5448.0"/>
								<ScoreDistribution value="0" recordCount="16670.0"/>
							</Node>
						</Node>
						<Node score="1" recordCount="53286.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="48201.0"/>
							<ScoreDistribution value="0" recordCount="5085.0"/>
						</Node>
						<Node score="0" recordCount="17344.0">
							<True/>
							<ScoreDistribution value="1" recordCount="4519.0"/>
							<ScoreDistribution value="0" recordCount="12825.0"/>
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
INSERT INTO iot_prototype_training.models (key, model) VALUES ('025e3af2-7403-4497-bd1a-eef52d1bdd4e', textAsBlob('<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<PMML xmlns="http://www.dmg.org/PMML-4_3" xmlns:data="http://jpmml.org/jpmml-model/InlineTable" version="4.3">
	<Header>
		<Application name="JPMML-SparkML" version="1.5.1"/>
		<Timestamp>2020-07-26T18:27:00Z</Timestamp>
	</Header>
	<DataDictionary>
		<DataField name="operable" optype="categorical" dataType="integer">
			<Value value="0"/>
			<Value value="1"/>
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
							<data:input>0</data:input>
							<data:output>0</data:output>
						</row>
						<row>
							<data:input>1</data:input>
							<data:output>1</data:output>
						</row>
					</InlineTable>
				</MapValues>
			</OutputField>
			<OutputField name="probability(0)" optype="continuous" dataType="double" feature="probability" value="0"/>
			<OutputField name="probability(1)" optype="continuous" dataType="double" feature="probability" value="1"/>
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
						<Node score="0" recordCount="101656.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="71.5"/>
							<ScoreDistribution value="0" recordCount="99188.0"/>
							<ScoreDistribution value="1" recordCount="2468.0"/>
						</Node>
						<Node score="1" recordCount="58614.0">
							<True/>
							<ScoreDistribution value="0" recordCount="0.0"/>
							<ScoreDistribution value="1" recordCount="58614.0"/>
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
						<Node score="0" recordCount="101267.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="71.5"/>
							<ScoreDistribution value="0" recordCount="98888.0"/>
							<ScoreDistribution value="1" recordCount="2379.0"/>
						</Node>
						<Node score="1" recordCount="59181.0">
							<True/>
							<ScoreDistribution value="0" recordCount="0.0"/>
							<ScoreDistribution value="1" recordCount="59181.0"/>
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
						<Node score="0" recordCount="100693.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="71.5"/>
							<ScoreDistribution value="0" recordCount="98328.0"/>
							<ScoreDistribution value="1" recordCount="2365.0"/>
						</Node>
						<Node score="1" recordCount="58397.0">
							<True/>
							<ScoreDistribution value="0" recordCount="0.0"/>
							<ScoreDistribution value="1" recordCount="58397.0"/>
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
						<Node score="0" recordCount="101867.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="71.5"/>
							<ScoreDistribution value="0" recordCount="99455.0"/>
							<ScoreDistribution value="1" recordCount="2412.0"/>
						</Node>
						<Node score="1" recordCount="58962.0">
							<True/>
							<ScoreDistribution value="0" recordCount="0.0"/>
							<ScoreDistribution value="1" recordCount="58962.0"/>
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
					</MiningSchema>
					<Node>
						<True/>
						<Node>
							<SimplePredicate field="pressure" operator="lessOrEqual" value="945.5"/>
							<Node score="0" recordCount="15129.0">
								<SimplePredicate field="temperature" operator="lessOrEqual" value="71.5"/>
								<ScoreDistribution value="0" recordCount="14745.0"/>
								<ScoreDistribution value="1" recordCount="384.0"/>
							</Node>
							<Node score="1" recordCount="9229.0">
								<True/>
								<ScoreDistribution value="0" recordCount="0.0"/>
								<ScoreDistribution value="1" recordCount="9229.0"/>
							</Node>
						</Node>
						<Node score="0" recordCount="85669.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="71.5"/>
							<ScoreDistribution value="0" recordCount="83671.0"/>
							<ScoreDistribution value="1" recordCount="1998.0"/>
						</Node>
						<Node score="1" recordCount="49432.0">
							<True/>
							<ScoreDistribution value="0" recordCount="0.0"/>
							<ScoreDistribution value="1" recordCount="49432.0"/>
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
						<Node score="0" recordCount="101611.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="71.5"/>
							<ScoreDistribution value="0" recordCount="99121.0"/>
							<ScoreDistribution value="1" recordCount="2490.0"/>
						</Node>
						<Node score="1" recordCount="58699.0">
							<True/>
							<ScoreDistribution value="0" recordCount="0.0"/>
							<ScoreDistribution value="1" recordCount="58699.0"/>
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
						<Node score="0" recordCount="101318.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="71.5"/>
							<ScoreDistribution value="0" recordCount="98944.0"/>
							<ScoreDistribution value="1" recordCount="2374.0"/>
						</Node>
						<Node score="1" recordCount="58398.0">
							<True/>
							<ScoreDistribution value="0" recordCount="0.0"/>
							<ScoreDistribution value="1" recordCount="58398.0"/>
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
						<Node score="0" recordCount="101477.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="71.5"/>
							<ScoreDistribution value="0" recordCount="99049.0"/>
							<ScoreDistribution value="1" recordCount="2428.0"/>
						</Node>
						<Node score="1" recordCount="59065.0">
							<True/>
							<ScoreDistribution value="0" recordCount="0.0"/>
							<ScoreDistribution value="1" recordCount="59065.0"/>
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
						<Node score="0" recordCount="101829.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="71.5"/>
							<ScoreDistribution value="0" recordCount="99470.0"/>
							<ScoreDistribution value="1" recordCount="2359.0"/>
						</Node>
						<Node score="1" recordCount="58638.0">
							<True/>
							<ScoreDistribution value="0" recordCount="0.0"/>
							<ScoreDistribution value="1" recordCount="58638.0"/>
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
						<Node score="0" recordCount="101469.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="71.5"/>
							<ScoreDistribution value="0" recordCount="99032.0"/>
							<ScoreDistribution value="1" recordCount="2437.0"/>
						</Node>
						<Node score="1" recordCount="58603.0">
							<True/>
							<ScoreDistribution value="0" recordCount="0.0"/>
							<ScoreDistribution value="1" recordCount="58603.0"/>
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
						<Node score="0" recordCount="100813.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="71.5"/>
							<ScoreDistribution value="0" recordCount="98455.0"/>
							<ScoreDistribution value="1" recordCount="2358.0"/>
						</Node>
						<Node score="1" recordCount="58572.0">
							<True/>
							<ScoreDistribution value="0" recordCount="0.0"/>
							<ScoreDistribution value="1" recordCount="58572.0"/>
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
						<Node score="0" recordCount="100903.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="71.5"/>
							<ScoreDistribution value="0" recordCount="98477.0"/>
							<ScoreDistribution value="1" recordCount="2426.0"/>
						</Node>
						<Node score="1" recordCount="58857.0">
							<True/>
							<ScoreDistribution value="0" recordCount="0.0"/>
							<ScoreDistribution value="1" recordCount="58857.0"/>
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
						<Node score="0" recordCount="101322.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="71.5"/>
							<ScoreDistribution value="0" recordCount="98974.0"/>
							<ScoreDistribution value="1" recordCount="2348.0"/>
						</Node>
						<Node score="1" recordCount="59224.0">
							<True/>
							<ScoreDistribution value="0" recordCount="0.0"/>
							<ScoreDistribution value="1" recordCount="59224.0"/>
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
						<Node score="0" recordCount="101354.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="71.5"/>
							<ScoreDistribution value="0" recordCount="98983.0"/>
							<ScoreDistribution value="1" recordCount="2371.0"/>
						</Node>
						<Node score="1" recordCount="58741.0">
							<True/>
							<ScoreDistribution value="0" recordCount="0.0"/>
							<ScoreDistribution value="1" recordCount="58741.0"/>
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
						<Node score="0" recordCount="101507.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="71.5"/>
							<ScoreDistribution value="0" recordCount="99099.0"/>
							<ScoreDistribution value="1" recordCount="2408.0"/>
						</Node>
						<Node score="1" recordCount="58417.0">
							<True/>
							<ScoreDistribution value="0" recordCount="0.0"/>
							<ScoreDistribution value="1" recordCount="58417.0"/>
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
						<Node score="0" recordCount="101178.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="71.5"/>
							<ScoreDistribution value="0" recordCount="98689.0"/>
							<ScoreDistribution value="1" recordCount="2489.0"/>
						</Node>
						<Node score="1" recordCount="58932.0">
							<True/>
							<ScoreDistribution value="0" recordCount="0.0"/>
							<ScoreDistribution value="1" recordCount="58932.0"/>
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
						<Node score="0" recordCount="101367.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="71.5"/>
							<ScoreDistribution value="0" recordCount="98958.0"/>
							<ScoreDistribution value="1" recordCount="2409.0"/>
						</Node>
						<Node score="1" recordCount="58889.0">
							<True/>
							<ScoreDistribution value="0" recordCount="0.0"/>
							<ScoreDistribution value="1" recordCount="58889.0"/>
						</Node>
					</Node>
				</TreeModel>
			</Segment>
			<Segment id="18">
				<True/>
				<TreeModel functionName="classification" missingValueStrategy="nullPrediction" splitCharacteristic="multiSplit">
					<MiningSchema>
						<MiningField name="temperature"/>
						<MiningField name="pressure"/>
					</MiningSchema>
					<Node>
						<True/>
						<Node>
							<SimplePredicate field="pressure" operator="lessOrEqual" value="945.5"/>
							<Node score="0" recordCount="15473.0">
								<SimplePredicate field="temperature" operator="lessOrEqual" value="71.5"/>
								<ScoreDistribution value="0" recordCount="15066.0"/>
								<ScoreDistribution value="1" recordCount="407.0"/>
							</Node>
							<Node score="1" recordCount="9363.0">
								<True/>
								<ScoreDistribution value="0" recordCount="0.0"/>
								<ScoreDistribution value="1" recordCount="9363.0"/>
							</Node>
						</Node>
						<Node score="0" recordCount="85807.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="71.5"/>
							<ScoreDistribution value="0" recordCount="83775.0"/>
							<ScoreDistribution value="1" recordCount="2032.0"/>
						</Node>
						<Node score="1" recordCount="49665.0">
							<True/>
							<ScoreDistribution value="0" recordCount="0.0"/>
							<ScoreDistribution value="1" recordCount="49665.0"/>
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
						<MiningField name="wind"/>
					</MiningSchema>
					<Node>
						<True/>
						<Node>
							<SimplePredicate field="pressure" operator="lessOrEqual" value="945.5"/>
							<Node>
								<SimplePredicate field="wind" operator="lessOrEqual" value="10.5"/>
								<Node score="0" recordCount="2404.0">
									<SimplePredicate field="temperature" operator="lessOrEqual" value="71.5"/>
									<ScoreDistribution value="0" recordCount="2340.0"/>
									<ScoreDistribution value="1" recordCount="64.0"/>
								</Node>
								<Node score="1" recordCount="1351.0">
									<True/>
									<ScoreDistribution value="0" recordCount="0.0"/>
									<ScoreDistribution value="1" recordCount="1351.0"/>
								</Node>
							</Node>
							<Node score="0" recordCount="20775.0">
								<True/>
								<ScoreDistribution value="0" recordCount="12559.0"/>
								<ScoreDistribution value="1" recordCount="8216.0"/>
							</Node>
						</Node>
						<Node score="0" recordCount="86469.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="71.5"/>
							<ScoreDistribution value="0" recordCount="84421.0"/>
							<ScoreDistribution value="1" recordCount="2048.0"/>
						</Node>
						<Node score="1" recordCount="49497.0">
							<True/>
							<ScoreDistribution value="0" recordCount="0.0"/>
							<ScoreDistribution value="1" recordCount="49497.0"/>
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
						<Node score="0" recordCount="100901.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="71.5"/>
							<ScoreDistribution value="0" recordCount="98357.0"/>
							<ScoreDistribution value="1" recordCount="2544.0"/>
						</Node>
						<Node score="1" recordCount="58537.0">
							<True/>
							<ScoreDistribution value="0" recordCount="0.0"/>
							<ScoreDistribution value="1" recordCount="58537.0"/>
						</Node>
					</Node>
				</TreeModel>
			</Segment>
		</Segmentation>
	</MiningModel>
</PMML>
'));
INSERT INTO iot_prototype_training.models (key, model) VALUES ('3abe7b38-71bd-40d5-9528-e65b47034a96', textAsBlob('<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<PMML xmlns="http://www.dmg.org/PMML-4_3" xmlns:data="http://jpmml.org/jpmml-model/InlineTable" version="4.3">
	<Header>
		<Application name="JPMML-SparkML" version="1.5.1"/>
		<Timestamp>2020-07-26T05:06:48Z</Timestamp>
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
			<MiningField name="pressure"/>
			<MiningField name="wind"/>
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
						<MiningField name="pressure"/>
						<MiningField name="wind"/>
					</MiningSchema>
					<Node>
						<True/>
						<Node score="1" recordCount="121134.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="109292.0"/>
							<ScoreDistribution value="0" recordCount="11842.0"/>
						</Node>
						<Node>
							<SimplePredicate field="pressure" operator="lessOrEqual" value="907.5"/>
							<Node score="1" recordCount="26.0">
								<SimplePredicate field="wind" operator="lessOrEqual" value="1.5"/>
								<ScoreDistribution value="1" recordCount="13.0"/>
								<ScoreDistribution value="0" recordCount="13.0"/>
							</Node>
							<Node score="0" recordCount="1014.0">
								<True/>
								<ScoreDistribution value="1" recordCount="292.0"/>
								<ScoreDistribution value="0" recordCount="722.0"/>
							</Node>
						</Node>
						<Node score="0" recordCount="38655.0">
							<True/>
							<ScoreDistribution value="1" recordCount="9743.0"/>
							<ScoreDistribution value="0" recordCount="28912.0"/>
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
								<Node score="1" recordCount="2796.0">
									<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
									<ScoreDistribution value="1" recordCount="2510.0"/>
									<ScoreDistribution value="0" recordCount="286.0"/>
								</Node>
								<Node score="0" recordCount="875.0">
									<True/>
									<ScoreDistribution value="1" recordCount="222.0"/>
									<ScoreDistribution value="0" recordCount="653.0"/>
								</Node>
							</Node>
							<Node score="1" recordCount="7115.0">
								<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
								<ScoreDistribution value="1" recordCount="6381.0"/>
								<ScoreDistribution value="0" recordCount="734.0"/>
							</Node>
							<Node score="0" recordCount="2546.0">
								<True/>
								<ScoreDistribution value="1" recordCount="604.0"/>
								<ScoreDistribution value="0" recordCount="1942.0"/>
							</Node>
						</Node>
						<Node score="1" recordCount="109855.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="99271.0"/>
							<ScoreDistribution value="0" recordCount="10584.0"/>
						</Node>
						<Node score="0" recordCount="36272.0">
							<True/>
							<ScoreDistribution value="1" recordCount="9255.0"/>
							<ScoreDistribution value="0" recordCount="27017.0"/>
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
							<Node score="1" recordCount="25178.0">
								<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
								<ScoreDistribution value="1" recordCount="22512.0"/>
								<ScoreDistribution value="0" recordCount="2666.0"/>
							</Node>
							<Node score="0" recordCount="8227.0">
								<True/>
								<ScoreDistribution value="1" recordCount="2010.0"/>
								<ScoreDistribution value="0" recordCount="6217.0"/>
							</Node>
						</Node>
						<Node score="1" recordCount="95301.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="86073.0"/>
							<ScoreDistribution value="0" recordCount="9228.0"/>
						</Node>
						<Node score="0" recordCount="31602.0">
							<True/>
							<ScoreDistribution value="1" recordCount="8091.0"/>
							<ScoreDistribution value="0" recordCount="23511.0"/>
						</Node>
					</Node>
				</TreeModel>
			</Segment>
			<Segment id="19">
				<True/>
				<TreeModel functionName="classification" missingValueStrategy="nullPrediction" splitCharacteristic="multiSplit">
					<MiningSchema>
						<MiningField name="temperature"/>
						<MiningField name="wind"/>
					</MiningSchema>
					<Node>
						<True/>
						<Node>
							<SimplePredicate field="wind" operator="lessOrEqual" value="45.5"/>
							<Node score="1" recordCount="77958.0">
								<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
								<ScoreDistribution value="1" recordCount="70429.0"/>
								<ScoreDistribution value="0" recordCount="7529.0"/>
							</Node>
							<Node score="0" recordCount="25246.0">
								<True/>
								<ScoreDistribution value="1" recordCount="6414.0"/>
								<ScoreDistribution value="0" recordCount="18832.0"/>
							</Node>
						</Node>
						<Node score="1" recordCount="43076.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="38772.0"/>
							<ScoreDistribution value="0" recordCount="4304.0"/>
						</Node>
						<Node score="0" recordCount="14216.0">
							<True/>
							<ScoreDistribution value="1" recordCount="3553.0"/>
							<ScoreDistribution value="0" recordCount="10663.0"/>
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
INSERT INTO iot_prototype_training.models (key, model) VALUES ('f572853a-9840-4e7d-a56e-0fe932f2233f', textAsBlob('<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<PMML xmlns="http://www.dmg.org/PMML-4_3" xmlns:data="http://jpmml.org/jpmml-model/InlineTable" version="4.3">
	<Header>
		<Application name="JPMML-SparkML" version="1.5.1"/>
		<Timestamp>2020-07-26T03:28:29Z</Timestamp>
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
							<SimplePredicate field="pressure" operator="lessOrEqual" value="962.5"/>
							<Node>
								<SimplePredicate field="wind" operator="lessOrEqual" value="53.5"/>
								<Node score="1" recordCount="19065.0">
									<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
									<ScoreDistribution value="1" recordCount="17222.0"/>
									<ScoreDistribution value="0" recordCount="1843.0"/>
								</Node>
								<Node score="0" recordCount="6454.0">
									<True/>
									<ScoreDistribution value="1" recordCount="1602.0"/>
									<ScoreDistribution value="0" recordCount="4852.0"/>
								</Node>
							</Node>
							<Node score="1" recordCount="5980.0">
								<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
								<ScoreDistribution value="1" recordCount="5337.0"/>
								<ScoreDistribution value="0" recordCount="643.0"/>
							</Node>
							<Node score="0" recordCount="2093.0">
								<True/>
								<ScoreDistribution value="1" recordCount="479.0"/>
								<ScoreDistribution value="0" recordCount="1614.0"/>
							</Node>
						</Node>
						<Node score="1" recordCount="94721.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="85603.0"/>
							<ScoreDistribution value="0" recordCount="9118.0"/>
						</Node>
						<Node score="0" recordCount="31146.0">
							<True/>
							<ScoreDistribution value="1" recordCount="8000.0"/>
							<ScoreDistribution value="0" recordCount="23146.0"/>
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
						<MiningField name="pressure"/>
					</MiningSchema>
					<Node>
						<True/>
						<Node>
							<SimplePredicate field="pressure" operator="lessOrEqual" value="1161.5"/>
							<Node score="1" recordCount="105127.0">
								<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
								<ScoreDistribution value="1" recordCount="94876.0"/>
								<ScoreDistribution value="0" recordCount="10251.0"/>
							</Node>
							<Node score="0" recordCount="34592.0">
								<True/>
								<ScoreDistribution value="1" recordCount="8772.0"/>
								<ScoreDistribution value="0" recordCount="25820.0"/>
							</Node>
						</Node>
						<Node score="1" recordCount="15352.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="13709.0"/>
							<ScoreDistribution value="0" recordCount="1643.0"/>
						</Node>
						<Node score="0" recordCount="5237.0">
							<True/>
							<ScoreDistribution value="1" recordCount="1329.0"/>
							<ScoreDistribution value="0" recordCount="3908.0"/>
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
							<SimplePredicate field="pressure" operator="lessOrEqual" value="1068.5"/>
							<Node score="1" recordCount="67748.0">
								<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
								<ScoreDistribution value="1" recordCount="61000.0"/>
								<ScoreDistribution value="0" recordCount="6748.0"/>
							</Node>
							<Node score="0" recordCount="22118.0">
								<True/>
								<ScoreDistribution value="1" recordCount="5448.0"/>
								<ScoreDistribution value="0" recordCount="16670.0"/>
							</Node>
						</Node>
						<Node score="1" recordCount="53286.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="48201.0"/>
							<ScoreDistribution value="0" recordCount="5085.0"/>
						</Node>
						<Node score="0" recordCount="17344.0">
							<True/>
							<ScoreDistribution value="1" recordCount="4519.0"/>
							<ScoreDistribution value="0" recordCount="12825.0"/>
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
INSERT INTO iot_prototype_training.models (key, model) VALUES ('45047d1c-84f2-4445-bff9-104bf0c7f980', textAsBlob('<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<PMML xmlns="http://www.dmg.org/PMML-4_3" xmlns:data="http://jpmml.org/jpmml-model/InlineTable" version="4.3">
	<Header>
		<Application name="JPMML-SparkML" version="1.5.1"/>
		<Timestamp>2020-07-26T18:17:26Z</Timestamp>
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
							<SimplePredicate field="wind" operator="lessOrEqual" value="17.5"/>
							<Node>
								<SimplePredicate field="pressure" operator="lessOrEqual" value="1069.5"/>
								<Node score="1" recordCount="16790.0">
									<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
									<ScoreDistribution value="1" recordCount="15107.0"/>
									<ScoreDistribution value="0" recordCount="1683.0"/>
								</Node>
								<Node score="0" recordCount="5740.0">
									<True/>
									<ScoreDistribution value="1" recordCount="1402.0"/>
									<ScoreDistribution value="0" recordCount="4338.0"/>
								</Node>
							</Node>
							<Node score="1" recordCount="13320.0">
								<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
								<ScoreDistribution value="1" recordCount="11945.0"/>
								<ScoreDistribution value="0" recordCount="1375.0"/>
							</Node>
							<Node score="0" recordCount="4282.0">
								<True/>
								<ScoreDistribution value="1" recordCount="1086.0"/>
								<ScoreDistribution value="0" recordCount="3196.0"/>
							</Node>
						</Node>
						<Node score="1" recordCount="89656.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="81110.0"/>
							<ScoreDistribution value="0" recordCount="8546.0"/>
						</Node>
						<Node score="0" recordCount="29671.0">
							<True/>
							<ScoreDistribution value="1" recordCount="7593.0"/>
							<ScoreDistribution value="0" recordCount="22078.0"/>
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
						<MiningField name="pressure"/>
					</MiningSchema>
					<Node>
						<True/>
						<Node>
							<SimplePredicate field="pressure" operator="lessOrEqual" value="1104.5"/>
							<Node score="1" recordCount="82491.0">
								<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
								<ScoreDistribution value="1" recordCount="74448.0"/>
								<ScoreDistribution value="0" recordCount="8043.0"/>
							</Node>
							<Node score="0" recordCount="27017.0">
								<True/>
								<ScoreDistribution value="1" recordCount="6870.0"/>
								<ScoreDistribution value="0" recordCount="20147.0"/>
							</Node>
						</Node>
						<Node score="1" recordCount="37988.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="34137.0"/>
							<ScoreDistribution value="0" recordCount="3851.0"/>
						</Node>
						<Node score="0" recordCount="12812.0">
							<True/>
							<ScoreDistribution value="1" recordCount="3231.0"/>
							<ScoreDistribution value="0" recordCount="9581.0"/>
						</Node>
					</Node>
				</TreeModel>
			</Segment>
			<Segment id="19">
				<True/>
				<TreeModel functionName="classification" missingValueStrategy="nullPrediction" splitCharacteristic="multiSplit">
					<MiningSchema>
						<MiningField name="temperature"/>
						<MiningField name="wind"/>
					</MiningSchema>
					<Node>
						<True/>
						<Node>
							<SimplePredicate field="wind" operator="lessOrEqual" value="5.5"/>
							<Node score="1" recordCount="10211.0">
								<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
								<ScoreDistribution value="1" recordCount="9181.0"/>
								<ScoreDistribution value="0" recordCount="1030.0"/>
							</Node>
							<Node score="0" recordCount="3407.0">
								<True/>
								<ScoreDistribution value="1" recordCount="824.0"/>
								<ScoreDistribution value="0" recordCount="2583.0"/>
							</Node>
						</Node>
						<Node score="1" recordCount="110823.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="100020.0"/>
							<ScoreDistribution value="0" recordCount="10803.0"/>
						</Node>
						<Node score="0" recordCount="36055.0">
							<True/>
							<ScoreDistribution value="1" recordCount="9143.0"/>
							<ScoreDistribution value="0" recordCount="26912.0"/>
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
INSERT INTO iot_prototype_training.models (key, model) VALUES ('56ee16f7-9403-4a36-b1a4-f2d5c222ebac', textAsBlob('<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<PMML xmlns="http://www.dmg.org/PMML-4_3" xmlns:data="http://jpmml.org/jpmml-model/InlineTable" version="4.3">
	<Header>
		<Application name="JPMML-SparkML" version="1.5.1"/>
		<Timestamp>2020-07-26T03:25:39Z</Timestamp>
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
			<MiningField name="pressure"/>
			<MiningField name="temperature"/>
			<MiningField name="wind"/>
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
							<SimplePredicate field="pressure" operator="lessOrEqual" value="962.5"/>
							<Node>
								<SimplePredicate field="wind" operator="lessOrEqual" value="53.5"/>
								<Node score="1" recordCount="19065.0">
									<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
									<ScoreDistribution value="1" recordCount="17222.0"/>
									<ScoreDistribution value="0" recordCount="1843.0"/>
								</Node>
								<Node score="0" recordCount="6454.0">
									<True/>
									<ScoreDistribution value="1" recordCount="1602.0"/>
									<ScoreDistribution value="0" recordCount="4852.0"/>
								</Node>
							</Node>
							<Node score="1" recordCount="5980.0">
								<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
								<ScoreDistribution value="1" recordCount="5337.0"/>
								<ScoreDistribution value="0" recordCount="643.0"/>
							</Node>
							<Node score="0" recordCount="2093.0">
								<True/>
								<ScoreDistribution value="1" recordCount="479.0"/>
								<ScoreDistribution value="0" recordCount="1614.0"/>
							</Node>
						</Node>
						<Node score="1" recordCount="94721.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="85603.0"/>
							<ScoreDistribution value="0" recordCount="9118.0"/>
						</Node>
						<Node score="0" recordCount="31146.0">
							<True/>
							<ScoreDistribution value="1" recordCount="8000.0"/>
							<ScoreDistribution value="0" recordCount="23146.0"/>
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
						<MiningField name="pressure"/>
					</MiningSchema>
					<Node>
						<True/>
						<Node>
							<SimplePredicate field="pressure" operator="lessOrEqual" value="1161.5"/>
							<Node score="1" recordCount="105127.0">
								<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
								<ScoreDistribution value="1" recordCount="94876.0"/>
								<ScoreDistribution value="0" recordCount="10251.0"/>
							</Node>
							<Node score="0" recordCount="34592.0">
								<True/>
								<ScoreDistribution value="1" recordCount="8772.0"/>
								<ScoreDistribution value="0" recordCount="25820.0"/>
							</Node>
						</Node>
						<Node score="1" recordCount="15352.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="13709.0"/>
							<ScoreDistribution value="0" recordCount="1643.0"/>
						</Node>
						<Node score="0" recordCount="5237.0">
							<True/>
							<ScoreDistribution value="1" recordCount="1329.0"/>
							<ScoreDistribution value="0" recordCount="3908.0"/>
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
							<SimplePredicate field="pressure" operator="lessOrEqual" value="1068.5"/>
							<Node score="1" recordCount="67748.0">
								<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
								<ScoreDistribution value="1" recordCount="61000.0"/>
								<ScoreDistribution value="0" recordCount="6748.0"/>
							</Node>
							<Node score="0" recordCount="22118.0">
								<True/>
								<ScoreDistribution value="1" recordCount="5448.0"/>
								<ScoreDistribution value="0" recordCount="16670.0"/>
							</Node>
						</Node>
						<Node score="1" recordCount="53286.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="48201.0"/>
							<ScoreDistribution value="0" recordCount="5085.0"/>
						</Node>
						<Node score="0" recordCount="17344.0">
							<True/>
							<ScoreDistribution value="1" recordCount="4519.0"/>
							<ScoreDistribution value="0" recordCount="12825.0"/>
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
INSERT INTO iot_prototype_training.models (key, model) VALUES ('65822aef-37ee-47c9-96ba-1cb85f6ad810', textAsBlob('<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<PMML xmlns="http://www.dmg.org/PMML-4_3" xmlns:data="http://jpmml.org/jpmml-model/InlineTable" version="4.3">
	<Header>
		<Application name="JPMML-SparkML" version="1.5.1"/>
		<Timestamp>2020-07-26T17:08:57Z</Timestamp>
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
			<MiningField name="temperature"/>
			<MiningField name="wind"/>
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
						<MiningField name="wind"/>
					</MiningSchema>
					<Node>
						<True/>
						<Node>
							<SimplePredicate field="wind" operator="lessOrEqual" value="45.5"/>
							<Node>
								<SimplePredicate field="wind" operator="lessOrEqual" value="12.5"/>
								<Node score="1" recordCount="21789.0">
									<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
									<ScoreDistribution value="1" recordCount="19612.0"/>
									<ScoreDistribution value="0" recordCount="2177.0"/>
								</Node>
								<Node score="0" recordCount="7285.0">
									<True/>
									<ScoreDistribution value="1" recordCount="1843.0"/>
									<ScoreDistribution value="0" recordCount="5442.0"/>
								</Node>
							</Node>
							<Node score="1" recordCount="55850.0">
								<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
								<ScoreDistribution value="1" recordCount="50622.0"/>
								<ScoreDistribution value="0" recordCount="5228.0"/>
							</Node>
							<Node score="0" recordCount="18345.0">
								<True/>
								<ScoreDistribution value="1" recordCount="4736.0"/>
								<ScoreDistribution value="0" recordCount="13609.0"/>
							</Node>
						</Node>
						<Node score="1" recordCount="42127.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="37928.0"/>
							<ScoreDistribution value="0" recordCount="4199.0"/>
						</Node>
						<Node score="0" recordCount="14063.0">
							<True/>
							<ScoreDistribution value="1" recordCount="3502.0"/>
							<ScoreDistribution value="0" recordCount="10561.0"/>
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
						<MiningField name="pressure"/>
						<MiningField name="wind"/>
					</MiningSchema>
					<Node>
						<True/>
						<Node score="1" recordCount="120524.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="108670.0"/>
							<ScoreDistribution value="0" recordCount="11854.0"/>
						</Node>
						<Node score="0" recordCount="38457.0">
							<SimplePredicate field="wind" operator="lessOrEqual" value="68.5"/>
							<ScoreDistribution value="1" recordCount="9924.0"/>
							<ScoreDistribution value="0" recordCount="28533.0"/>
						</Node>
						<Node score="1" recordCount="29.0">
							<SimplePredicate field="pressure" operator="lessOrEqual" value="907.5"/>
							<ScoreDistribution value="1" recordCount="15.0"/>
							<ScoreDistribution value="0" recordCount="14.0"/>
						</Node>
						<Node score="0" recordCount="1062.0">
							<True/>
							<ScoreDistribution value="1" recordCount="200.0"/>
							<ScoreDistribution value="0" recordCount="862.0"/>
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
						<MiningField name="pressure"/>
					</MiningSchema>
					<Node>
						<True/>
						<Node>
							<SimplePredicate field="pressure" operator="lessOrEqual" value="956.5"/>
							<Node score="1" recordCount="22781.0">
								<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
								<ScoreDistribution value="1" recordCount="20490.0"/>
								<ScoreDistribution value="0" recordCount="2291.0"/>
							</Node>
							<Node score="0" recordCount="7865.0">
								<True/>
								<ScoreDistribution value="1" recordCount="1988.0"/>
								<ScoreDistribution value="0" recordCount="5877.0"/>
							</Node>
						</Node>
						<Node score="1" recordCount="97698.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="88095.0"/>
							<ScoreDistribution value="0" recordCount="9603.0"/>
						</Node>
						<Node score="0" recordCount="31964.0">
							<True/>
							<ScoreDistribution value="1" recordCount="8113.0"/>
							<ScoreDistribution value="0" recordCount="23851.0"/>
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
							<SimplePredicate field="pressure" operator="lessOrEqual" value="945.5"/>
							<Node score="1" recordCount="18210.0">
								<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
								<ScoreDistribution value="1" recordCount="16482.0"/>
								<ScoreDistribution value="0" recordCount="1728.0"/>
							</Node>
							<Node score="0" recordCount="6318.0">
								<True/>
								<ScoreDistribution value="1" recordCount="1600.0"/>
								<ScoreDistribution value="0" recordCount="4718.0"/>
							</Node>
						</Node>
						<Node score="1" recordCount="102824.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="92719.0"/>
							<ScoreDistribution value="0" recordCount="10105.0"/>
						</Node>
						<Node score="0" recordCount="33144.0">
							<True/>
							<ScoreDistribution value="1" recordCount="8367.0"/>
							<ScoreDistribution value="0" recordCount="24777.0"/>
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
INSERT INTO iot_prototype_training.models (key, model) VALUES ('68f6e28e-963d-47e0-8d17-85678d00bd6d', textAsBlob('<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<PMML xmlns="http://www.dmg.org/PMML-4_3" xmlns:data="http://jpmml.org/jpmml-model/InlineTable" version="4.3">
	<Header>
		<Application name="JPMML-SparkML" version="1.5.1"/>
		<Timestamp>2020-07-26T05:03:06Z</Timestamp>
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
			<MiningField name="pressure"/>
			<MiningField name="wind"/>
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
							<SimplePredicate field="pressure" operator="lessOrEqual" value="955.5"/>
							<Node>
								<SimplePredicate field="wind" operator="lessOrEqual" value="32.5"/>
								<Node score="1" recordCount="10395.0">
									<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
									<ScoreDistribution value="1" recordCount="9356.0"/>
									<ScoreDistribution value="0" recordCount="1039.0"/>
								</Node>
								<Node score="0" recordCount="3413.0">
									<True/>
									<ScoreDistribution value="1" recordCount="889.0"/>
									<ScoreDistribution value="0" recordCount="2524.0"/>
								</Node>
							</Node>
							<Node score="1" recordCount="11953.0">
								<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
								<ScoreDistribution value="1" recordCount="10724.0"/>
								<ScoreDistribution value="0" recordCount="1229.0"/>
							</Node>
							<Node score="0" recordCount="4145.0">
								<True/>
								<ScoreDistribution value="1" recordCount="1000.0"/>
								<ScoreDistribution value="0" recordCount="3145.0"/>
							</Node>
						</Node>
						<Node score="1" recordCount="97418.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="88082.0"/>
							<ScoreDistribution value="0" recordCount="9336.0"/>
						</Node>
						<Node score="0" recordCount="32135.0">
							<True/>
							<ScoreDistribution value="1" recordCount="8192.0"/>
							<ScoreDistribution value="0" recordCount="23943.0"/>
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
						<MiningField name="pressure"/>
					</MiningSchema>
					<Node>
						<True/>
						<Node>
							<SimplePredicate field="pressure" operator="lessOrEqual" value="1103.5"/>
							<Node score="1" recordCount="82007.0">
								<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
								<ScoreDistribution value="1" recordCount="74044.0"/>
								<ScoreDistribution value="0" recordCount="7963.0"/>
							</Node>
							<Node score="0" recordCount="26674.0">
								<True/>
								<ScoreDistribution value="1" recordCount="6761.0"/>
								<ScoreDistribution value="0" recordCount="19913.0"/>
							</Node>
						</Node>
						<Node score="1" recordCount="38472.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="34541.0"/>
							<ScoreDistribution value="0" recordCount="3931.0"/>
						</Node>
						<Node score="0" recordCount="13155.0">
							<True/>
							<ScoreDistribution value="1" recordCount="3340.0"/>
							<ScoreDistribution value="0" recordCount="9815.0"/>
						</Node>
					</Node>
				</TreeModel>
			</Segment>
			<Segment id="19">
				<True/>
				<TreeModel functionName="classification" missingValueStrategy="nullPrediction" splitCharacteristic="multiSplit">
					<MiningSchema>
						<MiningField name="temperature"/>
						<MiningField name="wind"/>
					</MiningSchema>
					<Node>
						<True/>
						<Node>
							<SimplePredicate field="wind" operator="lessOrEqual" value="63.5"/>
							<Node score="1" recordCount="108864.0">
								<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
								<ScoreDistribution value="1" recordCount="98199.0"/>
								<ScoreDistribution value="0" recordCount="10665.0"/>
							</Node>
							<Node score="0" recordCount="35696.0">
								<True/>
								<ScoreDistribution value="1" recordCount="9017.0"/>
								<ScoreDistribution value="0" recordCount="26679.0"/>
							</Node>
						</Node>
						<Node score="1" recordCount="12170.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="11002.0"/>
							<ScoreDistribution value="0" recordCount="1168.0"/>
						</Node>
						<Node score="0" recordCount="3766.0">
							<True/>
							<ScoreDistribution value="1" recordCount="950.0"/>
							<ScoreDistribution value="0" recordCount="2816.0"/>
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
INSERT INTO iot_prototype_training.models (key, model) VALUES ('55df1f6a-797d-4a8a-87e9-da7fe6c44dcd', textAsBlob('<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<PMML xmlns="http://www.dmg.org/PMML-4_3" xmlns:data="http://jpmml.org/jpmml-model/InlineTable" version="4.3">
	<Header>
		<Application name="JPMML-SparkML" version="1.5.1"/>
		<Timestamp>2020-07-26T04:06:39Z</Timestamp>
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
			<MiningField name="pressure"/>
			<MiningField name="temperature"/>
			<MiningField name="wind"/>
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
							<SimplePredicate field="pressure" operator="lessOrEqual" value="962.5"/>
							<Node>
								<SimplePredicate field="wind" operator="lessOrEqual" value="53.5"/>
								<Node score="1" recordCount="19065.0">
									<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
									<ScoreDistribution value="1" recordCount="17222.0"/>
									<ScoreDistribution value="0" recordCount="1843.0"/>
								</Node>
								<Node score="0" recordCount="6454.0">
									<True/>
									<ScoreDistribution value="1" recordCount="1602.0"/>
									<ScoreDistribution value="0" recordCount="4852.0"/>
								</Node>
							</Node>
							<Node score="1" recordCount="5980.0">
								<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
								<ScoreDistribution value="1" recordCount="5337.0"/>
								<ScoreDistribution value="0" recordCount="643.0"/>
							</Node>
							<Node score="0" recordCount="2093.0">
								<True/>
								<ScoreDistribution value="1" recordCount="479.0"/>
								<ScoreDistribution value="0" recordCount="1614.0"/>
							</Node>
						</Node>
						<Node score="1" recordCount="94721.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="85603.0"/>
							<ScoreDistribution value="0" recordCount="9118.0"/>
						</Node>
						<Node score="0" recordCount="31146.0">
							<True/>
							<ScoreDistribution value="1" recordCount="8000.0"/>
							<ScoreDistribution value="0" recordCount="23146.0"/>
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
						<MiningField name="pressure"/>
					</MiningSchema>
					<Node>
						<True/>
						<Node>
							<SimplePredicate field="pressure" operator="lessOrEqual" value="1161.5"/>
							<Node score="1" recordCount="105127.0">
								<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
								<ScoreDistribution value="1" recordCount="94876.0"/>
								<ScoreDistribution value="0" recordCount="10251.0"/>
							</Node>
							<Node score="0" recordCount="34592.0">
								<True/>
								<ScoreDistribution value="1" recordCount="8772.0"/>
								<ScoreDistribution value="0" recordCount="25820.0"/>
							</Node>
						</Node>
						<Node score="1" recordCount="15352.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="13709.0"/>
							<ScoreDistribution value="0" recordCount="1643.0"/>
						</Node>
						<Node score="0" recordCount="5237.0">
							<True/>
							<ScoreDistribution value="1" recordCount="1329.0"/>
							<ScoreDistribution value="0" recordCount="3908.0"/>
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
							<SimplePredicate field="pressure" operator="lessOrEqual" value="1068.5"/>
							<Node score="1" recordCount="67748.0">
								<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
								<ScoreDistribution value="1" recordCount="61000.0"/>
								<ScoreDistribution value="0" recordCount="6748.0"/>
							</Node>
							<Node score="0" recordCount="22118.0">
								<True/>
								<ScoreDistribution value="1" recordCount="5448.0"/>
								<ScoreDistribution value="0" recordCount="16670.0"/>
							</Node>
						</Node>
						<Node score="1" recordCount="53286.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="48201.0"/>
							<ScoreDistribution value="0" recordCount="5085.0"/>
						</Node>
						<Node score="0" recordCount="17344.0">
							<True/>
							<ScoreDistribution value="1" recordCount="4519.0"/>
							<ScoreDistribution value="0" recordCount="12825.0"/>
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
INSERT INTO iot_prototype_training.models (key, model) VALUES ('179d980e-45f8-422f-a953-0e4e231918db', textAsBlob('<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<PMML xmlns="http://www.dmg.org/PMML-4_3" xmlns:data="http://jpmml.org/jpmml-model/InlineTable" version="4.3">
	<Header>
		<Application name="JPMML-SparkML" version="1.5.1"/>
		<Timestamp>2020-07-26T03:08:04Z</Timestamp>
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
			<MiningField name="temperature"/>
			<MiningField name="pressure"/>
			<MiningField name="wind"/>
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
						<MiningField name="wind"/>
					</MiningSchema>
					<Node>
						<True/>
						<Node>
							<SimplePredicate field="wind" operator="lessOrEqual" value="32.5"/>
							<Node>
								<SimplePredicate field="wind" operator="lessOrEqual" value="19.5"/>
								<Node score="1" recordCount="33597.0">
									<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
									<ScoreDistribution value="1" recordCount="30263.0"/>
									<ScoreDistribution value="0" recordCount="3334.0"/>
								</Node>
								<Node score="0" recordCount="11179.0">
									<True/>
									<ScoreDistribution value="1" recordCount="2856.0"/>
									<ScoreDistribution value="0" recordCount="8323.0"/>
								</Node>
							</Node>
							<Node score="1" recordCount="22127.0">
								<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
								<ScoreDistribution value="1" recordCount="20156.0"/>
								<ScoreDistribution value="0" recordCount="1971.0"/>
							</Node>
							<Node score="0" recordCount="7150.0">
								<True/>
								<ScoreDistribution value="1" recordCount="1871.0"/>
								<ScoreDistribution value="0" recordCount="5279.0"/>
							</Node>
						</Node>
						<Node score="1" recordCount="64042.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="57743.0"/>
							<ScoreDistribution value="0" recordCount="6299.0"/>
						</Node>
						<Node score="0" recordCount="21364.0">
							<True/>
							<ScoreDistribution value="1" recordCount="5354.0"/>
							<ScoreDistribution value="0" recordCount="16010.0"/>
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
						<MiningField name="pressure"/>
					</MiningSchema>
					<Node>
						<True/>
						<Node>
							<SimplePredicate field="pressure" operator="lessOrEqual" value="907.5"/>
							<Node score="1" recordCount="3277.0">
								<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
								<ScoreDistribution value="1" recordCount="2976.0"/>
								<ScoreDistribution value="0" recordCount="301.0"/>
							</Node>
							<Node score="0" recordCount="1015.0">
								<True/>
								<ScoreDistribution value="1" recordCount="277.0"/>
								<ScoreDistribution value="0" recordCount="738.0"/>
							</Node>
						</Node>
						<Node score="1" recordCount="117202.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="105609.0"/>
							<ScoreDistribution value="0" recordCount="11593.0"/>
						</Node>
						<Node score="0" recordCount="38814.0">
							<True/>
							<ScoreDistribution value="1" recordCount="9824.0"/>
							<ScoreDistribution value="0" recordCount="28990.0"/>
						</Node>
					</Node>
				</TreeModel>
			</Segment>
			<Segment id="19">
				<True/>
				<TreeModel functionName="classification" missingValueStrategy="nullPrediction" splitCharacteristic="multiSplit">
					<MiningSchema>
						<MiningField name="temperature"/>
						<MiningField name="wind"/>
					</MiningSchema>
					<Node>
						<True/>
						<Node>
							<SimplePredicate field="wind" operator="lessOrEqual" value="63.5"/>
							<Node score="1" recordCount="109006.0">
								<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
								<ScoreDistribution value="1" recordCount="98292.0"/>
								<ScoreDistribution value="0" recordCount="10714.0"/>
							</Node>
							<Node score="0" recordCount="35652.0">
								<True/>
								<ScoreDistribution value="1" recordCount="8971.0"/>
								<ScoreDistribution value="0" recordCount="26681.0"/>
							</Node>
						</Node>
						<Node score="1" recordCount="12028.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="10909.0"/>
							<ScoreDistribution value="0" recordCount="1119.0"/>
						</Node>
						<Node score="0" recordCount="3810.0">
							<True/>
							<ScoreDistribution value="1" recordCount="996.0"/>
							<ScoreDistribution value="0" recordCount="2814.0"/>
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
INSERT INTO iot_prototype_training.models (key, model) VALUES ('3c7ec48c-9266-4c4b-ad7a-84814c955a6f', textAsBlob('<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<PMML xmlns="http://www.dmg.org/PMML-4_3" xmlns:data="http://jpmml.org/jpmml-model/InlineTable" version="4.3">
	<Header>
		<Application name="JPMML-SparkML" version="1.5.1"/>
		<Timestamp>2020-07-26T18:46:40Z</Timestamp>
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
							<SimplePredicate field="pressure" operator="lessOrEqual" value="955.5"/>
							<Node>
								<SimplePredicate field="wind" operator="lessOrEqual" value="32.5"/>
								<Node score="1" recordCount="10325.0">
									<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
									<ScoreDistribution value="1" recordCount="9334.0"/>
									<ScoreDistribution value="0" recordCount="991.0"/>
								</Node>
								<Node score="0" recordCount="3421.0">
									<True/>
									<ScoreDistribution value="1" recordCount="860.0"/>
									<ScoreDistribution value="0" recordCount="2561.0"/>
								</Node>
							</Node>
							<Node score="1" recordCount="11899.0">
								<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
								<ScoreDistribution value="1" recordCount="10665.0"/>
								<ScoreDistribution value="0" recordCount="1234.0"/>
							</Node>
							<Node score="0" recordCount="4107.0">
								<True/>
								<ScoreDistribution value="1" recordCount="973.0"/>
								<ScoreDistribution value="0" recordCount="3134.0"/>
							</Node>
						</Node>
						<Node score="1" recordCount="97542.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="88163.0"/>
							<ScoreDistribution value="0" recordCount="9379.0"/>
						</Node>
						<Node score="0" recordCount="32165.0">
							<True/>
							<ScoreDistribution value="1" recordCount="8248.0"/>
							<ScoreDistribution value="0" recordCount="23917.0"/>
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
						<MiningField name="pressure"/>
					</MiningSchema>
					<Node>
						<True/>
						<Node>
							<SimplePredicate field="pressure" operator="lessOrEqual" value="916.5"/>
							<Node score="1" recordCount="6989.0">
								<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
								<ScoreDistribution value="1" recordCount="6340.0"/>
								<ScoreDistribution value="0" recordCount="649.0"/>
							</Node>
							<Node score="0" recordCount="2234.0">
								<True/>
								<ScoreDistribution value="1" recordCount="606.0"/>
								<ScoreDistribution value="0" recordCount="1628.0"/>
							</Node>
						</Node>
						<Node score="1" recordCount="113490.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="102245.0"/>
							<ScoreDistribution value="0" recordCount="11245.0"/>
						</Node>
						<Node score="0" recordCount="37595.0">
							<True/>
							<ScoreDistribution value="1" recordCount="9495.0"/>
							<ScoreDistribution value="0" recordCount="28100.0"/>
						</Node>
					</Node>
				</TreeModel>
			</Segment>
			<Segment id="19">
				<True/>
				<TreeModel functionName="classification" missingValueStrategy="nullPrediction" splitCharacteristic="multiSplit">
					<MiningSchema>
						<MiningField name="temperature"/>
						<MiningField name="wind"/>
					</MiningSchema>
					<Node>
						<True/>
						<Node>
							<SimplePredicate field="wind" operator="lessOrEqual" value="63.5"/>
							<Node score="1" recordCount="108884.0">
								<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
								<ScoreDistribution value="1" recordCount="98227.0"/>
								<ScoreDistribution value="0" recordCount="10657.0"/>
							</Node>
							<Node score="0" recordCount="35687.0">
								<True/>
								<ScoreDistribution value="1" recordCount="8997.0"/>
								<ScoreDistribution value="0" recordCount="26690.0"/>
							</Node>
						</Node>
						<Node score="1" recordCount="12150.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="10974.0"/>
							<ScoreDistribution value="0" recordCount="1176.0"/>
						</Node>
						<Node score="0" recordCount="3775.0">
							<True/>
							<ScoreDistribution value="1" recordCount="970.0"/>
							<ScoreDistribution value="0" recordCount="2805.0"/>
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
INSERT INTO iot_prototype_training.models (key, model) VALUES ('abed1e0f-c525-45ff-a81b-84cc734ba171', textAsBlob('<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<PMML xmlns="http://www.dmg.org/PMML-4_3" xmlns:data="http://jpmml.org/jpmml-model/InlineTable" version="4.3">
	<Header>
		<Application name="JPMML-SparkML" version="1.5.1"/>
		<Timestamp>2020-07-26T18:35:49Z</Timestamp>
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
			<MiningField name="pressure"/>
			<MiningField name="temperature"/>
			<MiningField name="wind"/>
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
						<Node score="1" recordCount="99012.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="70.5"/>
							<ScoreDistribution value="1" recordCount="99012.0"/>
							<ScoreDistribution value="0" recordCount="0.0"/>
						</Node>
						<Node score="0" recordCount="61258.0">
							<True/>
							<ScoreDistribution value="1" recordCount="0.0"/>
							<ScoreDistribution value="0" recordCount="61258.0"/>
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
						<Node score="1" recordCount="98950.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="70.5"/>
							<ScoreDistribution value="1" recordCount="98950.0"/>
							<ScoreDistribution value="0" recordCount="0.0"/>
						</Node>
						<Node score="0" recordCount="61498.0">
							<True/>
							<ScoreDistribution value="1" recordCount="0.0"/>
							<ScoreDistribution value="0" recordCount="61498.0"/>
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
						<Node score="1" recordCount="98297.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="70.5"/>
							<ScoreDistribution value="1" recordCount="98297.0"/>
							<ScoreDistribution value="0" recordCount="0.0"/>
						</Node>
						<Node score="0" recordCount="60793.0">
							<True/>
							<ScoreDistribution value="1" recordCount="0.0"/>
							<ScoreDistribution value="0" recordCount="60793.0"/>
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
						<Node score="1" recordCount="99458.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="70.5"/>
							<ScoreDistribution value="1" recordCount="99458.0"/>
							<ScoreDistribution value="0" recordCount="0.0"/>
						</Node>
						<Node score="0" recordCount="61371.0">
							<True/>
							<ScoreDistribution value="1" recordCount="0.0"/>
							<ScoreDistribution value="0" recordCount="61371.0"/>
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
							<SimplePredicate field="wind" operator="lessOrEqual" value="44.5"/>
							<Node score="1" recordCount="62623.0">
								<SimplePredicate field="temperature" operator="lessOrEqual" value="70.5"/>
								<ScoreDistribution value="1" recordCount="62623.0"/>
								<ScoreDistribution value="0" recordCount="0.0"/>
							</Node>
							<Node score="0" recordCount="38361.0">
								<True/>
								<ScoreDistribution value="1" recordCount="0.0"/>
								<ScoreDistribution value="0" recordCount="38361.0"/>
							</Node>
						</Node>
						<Node score="1" recordCount="56715.0">
							<SimplePredicate field="pressure" operator="lessOrEqual" value="1191.5"/>
							<ScoreDistribution value="1" recordCount="34755.0"/>
							<ScoreDistribution value="0" recordCount="21960.0"/>
						</Node>
						<Node score="1" recordCount="1634.0">
							<SimplePredicate field="wind" operator="lessOrEqual" value="68.5"/>
							<ScoreDistribution value="1" recordCount="941.0"/>
							<ScoreDistribution value="0" recordCount="693.0"/>
						</Node>
						<Node score="0" recordCount="126.0">
							<True/>
							<ScoreDistribution value="1" recordCount="61.0"/>
							<ScoreDistribution value="0" recordCount="65.0"/>
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
						<Node score="1" recordCount="99154.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="70.5"/>
							<ScoreDistribution value="1" recordCount="99154.0"/>
							<ScoreDistribution value="0" recordCount="0.0"/>
						</Node>
						<Node score="0" recordCount="61156.0">
							<True/>
							<ScoreDistribution value="1" recordCount="0.0"/>
							<ScoreDistribution value="0" recordCount="61156.0"/>
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
						<Node score="1" recordCount="98984.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="70.5"/>
							<ScoreDistribution value="1" recordCount="98984.0"/>
							<ScoreDistribution value="0" recordCount="0.0"/>
						</Node>
						<Node score="0" recordCount="60732.0">
							<True/>
							<ScoreDistribution value="1" recordCount="0.0"/>
							<ScoreDistribution value="0" recordCount="60732.0"/>
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
						<Node score="1" recordCount="98921.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="70.5"/>
							<ScoreDistribution value="1" recordCount="98921.0"/>
							<ScoreDistribution value="0" recordCount="0.0"/>
						</Node>
						<Node score="0" recordCount="61621.0">
							<True/>
							<ScoreDistribution value="1" recordCount="0.0"/>
							<ScoreDistribution value="0" recordCount="61621.0"/>
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
						<Node score="1" recordCount="99509.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="70.5"/>
							<ScoreDistribution value="1" recordCount="99509.0"/>
							<ScoreDistribution value="0" recordCount="0.0"/>
						</Node>
						<Node score="0" recordCount="60958.0">
							<True/>
							<ScoreDistribution value="1" recordCount="0.0"/>
							<ScoreDistribution value="0" recordCount="60958.0"/>
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
						<Node score="1" recordCount="99218.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="70.5"/>
							<ScoreDistribution value="1" recordCount="99218.0"/>
							<ScoreDistribution value="0" recordCount="0.0"/>
						</Node>
						<Node score="0" recordCount="60854.0">
							<True/>
							<ScoreDistribution value="1" recordCount="0.0"/>
							<ScoreDistribution value="0" recordCount="60854.0"/>
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
						<Node score="1" recordCount="98449.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="70.5"/>
							<ScoreDistribution value="1" recordCount="98449.0"/>
							<ScoreDistribution value="0" recordCount="0.0"/>
						</Node>
						<Node score="0" recordCount="60936.0">
							<True/>
							<ScoreDistribution value="1" recordCount="0.0"/>
							<ScoreDistribution value="0" recordCount="60936.0"/>
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
						<Node score="1" recordCount="98442.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="70.5"/>
							<ScoreDistribution value="1" recordCount="98442.0"/>
							<ScoreDistribution value="0" recordCount="0.0"/>
						</Node>
						<Node score="0" recordCount="61318.0">
							<True/>
							<ScoreDistribution value="1" recordCount="0.0"/>
							<ScoreDistribution value="0" recordCount="61318.0"/>
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
						<Node score="1" recordCount="98995.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="70.5"/>
							<ScoreDistribution value="1" recordCount="98995.0"/>
							<ScoreDistribution value="0" recordCount="0.0"/>
						</Node>
						<Node score="0" recordCount="61551.0">
							<True/>
							<ScoreDistribution value="1" recordCount="0.0"/>
							<ScoreDistribution value="0" recordCount="61551.0"/>
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
						<Node score="1" recordCount="98975.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="70.5"/>
							<ScoreDistribution value="1" recordCount="98975.0"/>
							<ScoreDistribution value="0" recordCount="0.0"/>
						</Node>
						<Node score="0" recordCount="61120.0">
							<True/>
							<ScoreDistribution value="1" recordCount="0.0"/>
							<ScoreDistribution value="0" recordCount="61120.0"/>
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
						<Node score="1" recordCount="98974.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="70.5"/>
							<ScoreDistribution value="1" recordCount="98974.0"/>
							<ScoreDistribution value="0" recordCount="0.0"/>
						</Node>
						<Node score="0" recordCount="60950.0">
							<True/>
							<ScoreDistribution value="1" recordCount="0.0"/>
							<ScoreDistribution value="0" recordCount="60950.0"/>
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
						<Node score="1" recordCount="98824.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="70.5"/>
							<ScoreDistribution value="1" recordCount="98824.0"/>
							<ScoreDistribution value="0" recordCount="0.0"/>
						</Node>
						<Node score="0" recordCount="61286.0">
							<True/>
							<ScoreDistribution value="1" recordCount="0.0"/>
							<ScoreDistribution value="0" recordCount="61286.0"/>
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
						<Node score="1" recordCount="99088.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="70.5"/>
							<ScoreDistribution value="1" recordCount="99088.0"/>
							<ScoreDistribution value="0" recordCount="0.0"/>
						</Node>
						<Node score="0" recordCount="61168.0">
							<True/>
							<ScoreDistribution value="1" recordCount="0.0"/>
							<ScoreDistribution value="0" recordCount="61168.0"/>
						</Node>
					</Node>
				</TreeModel>
			</Segment>
			<Segment id="18">
				<True/>
				<TreeModel functionName="classification" missingValueStrategy="nullPrediction" splitCharacteristic="multiSplit">
					<MiningSchema>
						<MiningField name="temperature"/>
						<MiningField name="pressure"/>
					</MiningSchema>
					<Node>
						<True/>
						<Node>
							<SimplePredicate field="pressure" operator="lessOrEqual" value="955.5"/>
							<Node score="1" recordCount="18363.0">
								<SimplePredicate field="temperature" operator="lessOrEqual" value="70.5"/>
								<ScoreDistribution value="1" recordCount="18363.0"/>
								<ScoreDistribution value="0" recordCount="0.0"/>
							</Node>
							<Node score="0" recordCount="11798.0">
								<True/>
								<ScoreDistribution value="1" recordCount="0.0"/>
								<ScoreDistribution value="0" recordCount="11798.0"/>
							</Node>
						</Node>
						<Node score="1" recordCount="80711.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="70.5"/>
							<ScoreDistribution value="1" recordCount="80711.0"/>
							<ScoreDistribution value="0" recordCount="0.0"/>
						</Node>
						<Node score="0" recordCount="49436.0">
							<True/>
							<ScoreDistribution value="1" recordCount="0.0"/>
							<ScoreDistribution value="0" recordCount="49436.0"/>
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
						<MiningField name="wind"/>
					</MiningSchema>
					<Node>
						<True/>
						<Node>
							<SimplePredicate field="pressure" operator="lessOrEqual" value="945.5"/>
							<Node>
								<SimplePredicate field="wind" operator="lessOrEqual" value="10.5"/>
								<Node score="1" recordCount="2397.0">
									<SimplePredicate field="temperature" operator="lessOrEqual" value="70.5"/>
									<ScoreDistribution value="1" recordCount="2397.0"/>
									<ScoreDistribution value="0" recordCount="0.0"/>
								</Node>
								<Node score="0" recordCount="1340.0">
									<True/>
									<ScoreDistribution value="1" recordCount="0.0"/>
									<ScoreDistribution value="0" recordCount="1340.0"/>
								</Node>
							</Node>
							<Node score="1" recordCount="12460.0">
								<SimplePredicate field="temperature" operator="lessOrEqual" value="70.5"/>
								<ScoreDistribution value="1" recordCount="12460.0"/>
								<ScoreDistribution value="0" recordCount="0.0"/>
							</Node>
							<Node score="0" recordCount="8090.0">
								<True/>
								<ScoreDistribution value="1" recordCount="0.0"/>
								<ScoreDistribution value="0" recordCount="8090.0"/>
							</Node>
						</Node>
						<Node score="1" recordCount="84589.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="70.5"/>
							<ScoreDistribution value="1" recordCount="84589.0"/>
							<ScoreDistribution value="0" recordCount="0.0"/>
						</Node>
						<Node score="0" recordCount="51620.0">
							<True/>
							<ScoreDistribution value="1" recordCount="0.0"/>
							<ScoreDistribution value="0" recordCount="51620.0"/>
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
						<Node score="1" recordCount="98351.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="70.5"/>
							<ScoreDistribution value="1" recordCount="98351.0"/>
							<ScoreDistribution value="0" recordCount="0.0"/>
						</Node>
						<Node score="0" recordCount="61087.0">
							<True/>
							<ScoreDistribution value="1" recordCount="0.0"/>
							<ScoreDistribution value="0" recordCount="61087.0"/>
						</Node>
					</Node>
				</TreeModel>
			</Segment>
		</Segmentation>
	</MiningModel>
</PMML>
'));
INSERT INTO iot_prototype_training.models (key, model) VALUES ('67bb6c55-9d0f-457c-8d8a-67f33de78eba', textAsBlob('<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<PMML xmlns="http://www.dmg.org/PMML-4_3" xmlns:data="http://jpmml.org/jpmml-model/InlineTable" version="4.3">
	<Header>
		<Application name="JPMML-SparkML" version="1.5.1"/>
		<Timestamp>2020-07-26T18:42:35Z</Timestamp>
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
							<SimplePredicate field="pressure" operator="lessOrEqual" value="955.5"/>
							<Node>
								<SimplePredicate field="wind" operator="lessOrEqual" value="32.5"/>
								<Node score="1" recordCount="10325.0">
									<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
									<ScoreDistribution value="1" recordCount="9334.0"/>
									<ScoreDistribution value="0" recordCount="991.0"/>
								</Node>
								<Node score="0" recordCount="3421.0">
									<True/>
									<ScoreDistribution value="1" recordCount="860.0"/>
									<ScoreDistribution value="0" recordCount="2561.0"/>
								</Node>
							</Node>
							<Node score="1" recordCount="11899.0">
								<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
								<ScoreDistribution value="1" recordCount="10665.0"/>
								<ScoreDistribution value="0" recordCount="1234.0"/>
							</Node>
							<Node score="0" recordCount="4107.0">
								<True/>
								<ScoreDistribution value="1" recordCount="973.0"/>
								<ScoreDistribution value="0" recordCount="3134.0"/>
							</Node>
						</Node>
						<Node score="1" recordCount="97542.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="88163.0"/>
							<ScoreDistribution value="0" recordCount="9379.0"/>
						</Node>
						<Node score="0" recordCount="32165.0">
							<True/>
							<ScoreDistribution value="1" recordCount="8248.0"/>
							<ScoreDistribution value="0" recordCount="23917.0"/>
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
						<MiningField name="pressure"/>
					</MiningSchema>
					<Node>
						<True/>
						<Node>
							<SimplePredicate field="pressure" operator="lessOrEqual" value="916.5"/>
							<Node score="1" recordCount="6989.0">
								<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
								<ScoreDistribution value="1" recordCount="6340.0"/>
								<ScoreDistribution value="0" recordCount="649.0"/>
							</Node>
							<Node score="0" recordCount="2234.0">
								<True/>
								<ScoreDistribution value="1" recordCount="606.0"/>
								<ScoreDistribution value="0" recordCount="1628.0"/>
							</Node>
						</Node>
						<Node score="1" recordCount="113490.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="102245.0"/>
							<ScoreDistribution value="0" recordCount="11245.0"/>
						</Node>
						<Node score="0" recordCount="37595.0">
							<True/>
							<ScoreDistribution value="1" recordCount="9495.0"/>
							<ScoreDistribution value="0" recordCount="28100.0"/>
						</Node>
					</Node>
				</TreeModel>
			</Segment>
			<Segment id="19">
				<True/>
				<TreeModel functionName="classification" missingValueStrategy="nullPrediction" splitCharacteristic="multiSplit">
					<MiningSchema>
						<MiningField name="temperature"/>
						<MiningField name="wind"/>
					</MiningSchema>
					<Node>
						<True/>
						<Node>
							<SimplePredicate field="wind" operator="lessOrEqual" value="63.5"/>
							<Node score="1" recordCount="108884.0">
								<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
								<ScoreDistribution value="1" recordCount="98227.0"/>
								<ScoreDistribution value="0" recordCount="10657.0"/>
							</Node>
							<Node score="0" recordCount="35687.0">
								<True/>
								<ScoreDistribution value="1" recordCount="8997.0"/>
								<ScoreDistribution value="0" recordCount="26690.0"/>
							</Node>
						</Node>
						<Node score="1" recordCount="12150.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="10974.0"/>
							<ScoreDistribution value="0" recordCount="1176.0"/>
						</Node>
						<Node score="0" recordCount="3775.0">
							<True/>
							<ScoreDistribution value="1" recordCount="970.0"/>
							<ScoreDistribution value="0" recordCount="2805.0"/>
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
INSERT INTO iot_prototype_training.models (key, model) VALUES ('1b544fa3-5346-495d-929d-9e4dcdeb2d7d', textAsBlob('<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<PMML xmlns="http://www.dmg.org/PMML-4_3" xmlns:data="http://jpmml.org/jpmml-model/InlineTable" version="4.3">
	<Header>
		<Application name="JPMML-SparkML" version="1.5.1"/>
		<Timestamp>2020-07-26T02:45:32Z</Timestamp>
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
			<MiningField name="temperature"/>
			<MiningField name="pressure"/>
			<MiningField name="wind"/>
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
						<MiningField name="wind"/>
					</MiningSchema>
					<Node>
						<True/>
						<Node>
							<SimplePredicate field="wind" operator="lessOrEqual" value="32.5"/>
							<Node>
								<SimplePredicate field="wind" operator="lessOrEqual" value="19.5"/>
								<Node score="1" recordCount="33597.0">
									<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
									<ScoreDistribution value="1" recordCount="30263.0"/>
									<ScoreDistribution value="0" recordCount="3334.0"/>
								</Node>
								<Node score="0" recordCount="11179.0">
									<True/>
									<ScoreDistribution value="1" recordCount="2856.0"/>
									<ScoreDistribution value="0" recordCount="8323.0"/>
								</Node>
							</Node>
							<Node score="1" recordCount="22127.0">
								<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
								<ScoreDistribution value="1" recordCount="20156.0"/>
								<ScoreDistribution value="0" recordCount="1971.0"/>
							</Node>
							<Node score="0" recordCount="7150.0">
								<True/>
								<ScoreDistribution value="1" recordCount="1871.0"/>
								<ScoreDistribution value="0" recordCount="5279.0"/>
							</Node>
						</Node>
						<Node score="1" recordCount="64042.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="57743.0"/>
							<ScoreDistribution value="0" recordCount="6299.0"/>
						</Node>
						<Node score="0" recordCount="21364.0">
							<True/>
							<ScoreDistribution value="1" recordCount="5354.0"/>
							<ScoreDistribution value="0" recordCount="16010.0"/>
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
						<MiningField name="pressure"/>
					</MiningSchema>
					<Node>
						<True/>
						<Node>
							<SimplePredicate field="pressure" operator="lessOrEqual" value="907.5"/>
							<Node score="1" recordCount="3277.0">
								<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
								<ScoreDistribution value="1" recordCount="2976.0"/>
								<ScoreDistribution value="0" recordCount="301.0"/>
							</Node>
							<Node score="0" recordCount="1015.0">
								<True/>
								<ScoreDistribution value="1" recordCount="277.0"/>
								<ScoreDistribution value="0" recordCount="738.0"/>
							</Node>
						</Node>
						<Node score="1" recordCount="117202.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="105609.0"/>
							<ScoreDistribution value="0" recordCount="11593.0"/>
						</Node>
						<Node score="0" recordCount="38814.0">
							<True/>
							<ScoreDistribution value="1" recordCount="9824.0"/>
							<ScoreDistribution value="0" recordCount="28990.0"/>
						</Node>
					</Node>
				</TreeModel>
			</Segment>
			<Segment id="19">
				<True/>
				<TreeModel functionName="classification" missingValueStrategy="nullPrediction" splitCharacteristic="multiSplit">
					<MiningSchema>
						<MiningField name="temperature"/>
						<MiningField name="wind"/>
					</MiningSchema>
					<Node>
						<True/>
						<Node>
							<SimplePredicate field="wind" operator="lessOrEqual" value="63.5"/>
							<Node score="1" recordCount="109006.0">
								<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
								<ScoreDistribution value="1" recordCount="98292.0"/>
								<ScoreDistribution value="0" recordCount="10714.0"/>
							</Node>
							<Node score="0" recordCount="35652.0">
								<True/>
								<ScoreDistribution value="1" recordCount="8971.0"/>
								<ScoreDistribution value="0" recordCount="26681.0"/>
							</Node>
						</Node>
						<Node score="1" recordCount="12028.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="10909.0"/>
							<ScoreDistribution value="0" recordCount="1119.0"/>
						</Node>
						<Node score="0" recordCount="3810.0">
							<True/>
							<ScoreDistribution value="1" recordCount="996.0"/>
							<ScoreDistribution value="0" recordCount="2814.0"/>
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
INSERT INTO iot_prototype_training.models (key, model) VALUES ('6ef39809-f3c6-49ad-a842-840426e70690', textAsBlob('<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<PMML xmlns="http://www.dmg.org/PMML-4_3" xmlns:data="http://jpmml.org/jpmml-model/InlineTable" version="4.3">
	<Header>
		<Application name="JPMML-SparkML" version="1.5.1"/>
		<Timestamp>2020-07-26T17:16:37Z</Timestamp>
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
			<MiningField name="pressure"/>
			<MiningField name="wind"/>
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
							<SimplePredicate field="pressure" operator="lessOrEqual" value="943.5"/>
							<Node>
								<SimplePredicate field="wind" operator="lessOrEqual" value="1.5"/>
								<Node score="1" recordCount="511.0">
									<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
									<ScoreDistribution value="1" recordCount="450.0"/>
									<ScoreDistribution value="0" recordCount="61.0"/>
								</Node>
								<Node score="0" recordCount="205.0">
									<True/>
									<ScoreDistribution value="1" recordCount="41.0"/>
									<ScoreDistribution value="0" recordCount="164.0"/>
								</Node>
							</Node>
							<Node score="1" recordCount="16921.0">
								<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
								<ScoreDistribution value="1" recordCount="15257.0"/>
								<ScoreDistribution value="0" recordCount="1664.0"/>
							</Node>
							<Node score="0" recordCount="5842.0">
								<True/>
								<ScoreDistribution value="1" recordCount="1439.0"/>
								<ScoreDistribution value="0" recordCount="4403.0"/>
							</Node>
						</Node>
						<Node score="1" recordCount="102334.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="92455.0"/>
							<ScoreDistribution value="0" recordCount="9879.0"/>
						</Node>
						<Node score="0" recordCount="33646.0">
							<True/>
							<ScoreDistribution value="1" recordCount="8601.0"/>
							<ScoreDistribution value="0" recordCount="25045.0"/>
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
							<SimplePredicate field="wind" operator="lessOrEqual" value="12.5"/>
							<Node score="1" recordCount="21891.0">
								<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
								<ScoreDistribution value="1" recordCount="19569.0"/>
								<ScoreDistribution value="0" recordCount="2322.0"/>
							</Node>
							<Node score="0" recordCount="7311.0">
								<True/>
								<ScoreDistribution value="1" recordCount="1776.0"/>
								<ScoreDistribution value="0" recordCount="5535.0"/>
							</Node>
						</Node>
						<Node score="1" recordCount="98588.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="89016.0"/>
							<ScoreDistribution value="0" recordCount="9572.0"/>
						</Node>
						<Node score="0" recordCount="32518.0">
							<True/>
							<ScoreDistribution value="1" recordCount="8325.0"/>
							<ScoreDistribution value="0" recordCount="24193.0"/>
						</Node>
					</Node>
				</TreeModel>
			</Segment>
			<Segment id="19">
				<True/>
				<TreeModel functionName="classification" missingValueStrategy="nullPrediction" splitCharacteristic="multiSplit">
					<MiningSchema>
						<MiningField name="temperature"/>
						<MiningField name="wind"/>
					</MiningSchema>
					<Node>
						<True/>
						<Node>
							<SimplePredicate field="wind" operator="lessOrEqual" value="63.5"/>
							<Node score="1" recordCount="108806.0">
								<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
								<ScoreDistribution value="1" recordCount="98147.0"/>
								<ScoreDistribution value="0" recordCount="10659.0"/>
							</Node>
							<Node score="0" recordCount="35640.0">
								<True/>
								<ScoreDistribution value="1" recordCount="8988.0"/>
								<ScoreDistribution value="0" recordCount="26652.0"/>
							</Node>
						</Node>
						<Node score="1" recordCount="12228.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="11054.0"/>
							<ScoreDistribution value="0" recordCount="1174.0"/>
						</Node>
						<Node score="0" recordCount="3822.0">
							<True/>
							<ScoreDistribution value="1" recordCount="979.0"/>
							<ScoreDistribution value="0" recordCount="2843.0"/>
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
INSERT INTO iot_prototype_training.models (key, model) VALUES ('60b518ea-44dd-493d-917b-e126a54c8c47', textAsBlob('<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<PMML xmlns="http://www.dmg.org/PMML-4_3" xmlns:data="http://jpmml.org/jpmml-model/InlineTable" version="4.3">
	<Header>
		<Application name="JPMML-SparkML" version="1.5.1"/>
		<Timestamp>2020-07-26T03:14:35Z</Timestamp>
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
			<MiningField name="temperature"/>
			<MiningField name="wind"/>
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
							<SimplePredicate field="pressure" operator="lessOrEqual" value="962.5"/>
							<Node>
								<SimplePredicate field="wind" operator="lessOrEqual" value="53.5"/>
								<Node score="1" recordCount="19065.0">
									<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
									<ScoreDistribution value="1" recordCount="17222.0"/>
									<ScoreDistribution value="0" recordCount="1843.0"/>
								</Node>
								<Node score="0" recordCount="6454.0">
									<True/>
									<ScoreDistribution value="1" recordCount="1602.0"/>
									<ScoreDistribution value="0" recordCount="4852.0"/>
								</Node>
							</Node>
							<Node score="1" recordCount="5980.0">
								<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
								<ScoreDistribution value="1" recordCount="5337.0"/>
								<ScoreDistribution value="0" recordCount="643.0"/>
							</Node>
							<Node score="0" recordCount="2093.0">
								<True/>
								<ScoreDistribution value="1" recordCount="479.0"/>
								<ScoreDistribution value="0" recordCount="1614.0"/>
							</Node>
						</Node>
						<Node score="1" recordCount="94721.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="85603.0"/>
							<ScoreDistribution value="0" recordCount="9118.0"/>
						</Node>
						<Node score="0" recordCount="31146.0">
							<True/>
							<ScoreDistribution value="1" recordCount="8000.0"/>
							<ScoreDistribution value="0" recordCount="23146.0"/>
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
						<MiningField name="pressure"/>
					</MiningSchema>
					<Node>
						<True/>
						<Node>
							<SimplePredicate field="pressure" operator="lessOrEqual" value="1161.5"/>
							<Node score="1" recordCount="105127.0">
								<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
								<ScoreDistribution value="1" recordCount="94876.0"/>
								<ScoreDistribution value="0" recordCount="10251.0"/>
							</Node>
							<Node score="0" recordCount="34592.0">
								<True/>
								<ScoreDistribution value="1" recordCount="8772.0"/>
								<ScoreDistribution value="0" recordCount="25820.0"/>
							</Node>
						</Node>
						<Node score="1" recordCount="15352.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="13709.0"/>
							<ScoreDistribution value="0" recordCount="1643.0"/>
						</Node>
						<Node score="0" recordCount="5237.0">
							<True/>
							<ScoreDistribution value="1" recordCount="1329.0"/>
							<ScoreDistribution value="0" recordCount="3908.0"/>
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
							<SimplePredicate field="pressure" operator="lessOrEqual" value="1068.5"/>
							<Node score="1" recordCount="67748.0">
								<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
								<ScoreDistribution value="1" recordCount="61000.0"/>
								<ScoreDistribution value="0" recordCount="6748.0"/>
							</Node>
							<Node score="0" recordCount="22118.0">
								<True/>
								<ScoreDistribution value="1" recordCount="5448.0"/>
								<ScoreDistribution value="0" recordCount="16670.0"/>
							</Node>
						</Node>
						<Node score="1" recordCount="53286.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="48201.0"/>
							<ScoreDistribution value="0" recordCount="5085.0"/>
						</Node>
						<Node score="0" recordCount="17344.0">
							<True/>
							<ScoreDistribution value="1" recordCount="4519.0"/>
							<ScoreDistribution value="0" recordCount="12825.0"/>
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
INSERT INTO iot_prototype_training.models (key, model) VALUES ('6ad26cbf-5e39-4512-94b1-37fdb9013e62', textAsBlob('<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<PMML xmlns="http://www.dmg.org/PMML-4_3" xmlns:data="http://jpmml.org/jpmml-model/InlineTable" version="4.3">
	<Header>
		<Application name="JPMML-SparkML" version="1.5.1"/>
		<Timestamp>2020-07-26T18:11:39Z</Timestamp>
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
						<MiningField name="pressure"/>
						<MiningField name="wind"/>
					</MiningSchema>
					<Node>
						<True/>
						<Node score="1" recordCount="120507.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="108616.0"/>
							<ScoreDistribution value="0" recordCount="11891.0"/>
						</Node>
						<Node score="0" recordCount="38786.0">
							<SimplePredicate field="wind" operator="lessOrEqual" value="68.5"/>
							<ScoreDistribution value="1" recordCount="9989.0"/>
							<ScoreDistribution value="0" recordCount="28797.0"/>
						</Node>
						<Node score="1" recordCount="30.0">
							<SimplePredicate field="pressure" operator="lessOrEqual" value="907.5"/>
							<ScoreDistribution value="1" recordCount="15.0"/>
							<ScoreDistribution value="0" recordCount="15.0"/>
						</Node>
						<Node score="0" recordCount="1125.0">
							<True/>
							<ScoreDistribution value="1" recordCount="243.0"/>
							<ScoreDistribution value="0" recordCount="882.0"/>
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
							<SimplePredicate field="wind" operator="lessOrEqual" value="5.5"/>
							<Node>
								<SimplePredicate field="pressure" operator="lessOrEqual" value="982.5"/>
								<Node score="1" recordCount="2781.0">
									<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
									<ScoreDistribution value="1" recordCount="2490.0"/>
									<ScoreDistribution value="0" recordCount="291.0"/>
								</Node>
								<Node score="0" recordCount="891.0">
									<True/>
									<ScoreDistribution value="1" recordCount="223.0"/>
									<ScoreDistribution value="0" recordCount="668.0"/>
								</Node>
							</Node>
							<Node score="1" recordCount="7113.0">
								<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
								<ScoreDistribution value="1" recordCount="6372.0"/>
								<ScoreDistribution value="0" recordCount="741.0"/>
							</Node>
							<Node score="0" recordCount="2514.0">
								<True/>
								<ScoreDistribution value="1" recordCount="595.0"/>
								<ScoreDistribution value="0" recordCount="1919.0"/>
							</Node>
						</Node>
						<Node score="1" recordCount="109872.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="99300.0"/>
							<ScoreDistribution value="0" recordCount="10572.0"/>
						</Node>
						<Node score="0" recordCount="36288.0">
							<True/>
							<ScoreDistribution value="1" recordCount="9263.0"/>
							<ScoreDistribution value="0" recordCount="27025.0"/>
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
						<MiningField name="pressure"/>
					</MiningSchema>
					<Node>
						<True/>
						<Node>
							<SimplePredicate field="pressure" operator="lessOrEqual" value="1077.5"/>
							<Node score="1" recordCount="71461.0">
								<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
								<ScoreDistribution value="1" recordCount="64602.0"/>
								<ScoreDistribution value="0" recordCount="6859.0"/>
							</Node>
							<Node score="0" recordCount="23380.0">
								<True/>
								<ScoreDistribution value="1" recordCount="5942.0"/>
								<ScoreDistribution value="0" recordCount="17438.0"/>
							</Node>
						</Node>
						<Node score="1" recordCount="49018.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="43983.0"/>
							<ScoreDistribution value="0" recordCount="5035.0"/>
						</Node>
						<Node score="0" recordCount="16449.0">
							<True/>
							<ScoreDistribution value="1" recordCount="4159.0"/>
							<ScoreDistribution value="0" recordCount="12290.0"/>
						</Node>
					</Node>
				</TreeModel>
			</Segment>
			<Segment id="19">
				<True/>
				<TreeModel functionName="classification" missingValueStrategy="nullPrediction" splitCharacteristic="multiSplit">
					<MiningSchema>
						<MiningField name="temperature"/>
						<MiningField name="wind"/>
					</MiningSchema>
					<Node>
						<True/>
						<Node>
							<SimplePredicate field="wind" operator="lessOrEqual" value="45.5"/>
							<Node score="1" recordCount="78269.0">
								<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
								<ScoreDistribution value="1" recordCount="70668.0"/>
								<ScoreDistribution value="0" recordCount="7601.0"/>
							</Node>
							<Node score="0" recordCount="25353.0">
								<True/>
								<ScoreDistribution value="1" recordCount="6477.0"/>
								<ScoreDistribution value="0" recordCount="18876.0"/>
							</Node>
						</Node>
						<Node score="1" recordCount="42765.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="79.5"/>
							<ScoreDistribution value="1" recordCount="38533.0"/>
							<ScoreDistribution value="0" recordCount="4232.0"/>
						</Node>
						<Node score="0" recordCount="14109.0">
							<True/>
							<ScoreDistribution value="1" recordCount="3490.0"/>
							<ScoreDistribution value="0" recordCount="10619.0"/>
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