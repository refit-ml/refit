INSERT INTO cdl_refit.models (project_guid, model_guid, format, model, timestamp) VALUES ('b6ee5bab-08dd-49b0-98b6-45cd0a28b12f', '7fd8c924-7b21-440c-a53e-a5b54819c15c', 'PMML', textAsBlob('<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
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
INSERT INTO cdl_refit.models (project_guid, model_guid, format, model, timestamp) VALUES ('b6ee5bab-08dd-49b0-98b6-45cd0a28b12f', '68f0286b-ddc8-4dae-bf6e-9bde28e795f4', 'PMML', textAsBlob('<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<PMML xmlns="http://www.dmg.org/PMML-4_3" xmlns:data="http://jpmml.org/jpmml-model/InlineTable" version="4.3">
	<Header>
		<Application name="JPMML-SparkML" version="1.5.1"/>
		<Timestamp>2020-09-02T02:52:32Z</Timestamp>
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
						<Node score="1" recordCount="2799.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="41.5"/>
							<ScoreDistribution value="0" recordCount="221.0"/>
							<ScoreDistribution value="1" recordCount="2578.0"/>
						</Node>
						<Node score="0" recordCount="13416.0">
							<True/>
							<ScoreDistribution value="0" recordCount="13416.0"/>
							<ScoreDistribution value="1" recordCount="0.0"/>
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
						<Node score="1" recordCount="2920.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="41.5"/>
							<ScoreDistribution value="0" recordCount="245.0"/>
							<ScoreDistribution value="1" recordCount="2675.0"/>
						</Node>
						<Node score="0" recordCount="13115.0">
							<True/>
							<ScoreDistribution value="0" recordCount="13115.0"/>
							<ScoreDistribution value="1" recordCount="0.0"/>
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
						<Node score="1" recordCount="2795.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="41.5"/>
							<ScoreDistribution value="0" recordCount="215.0"/>
							<ScoreDistribution value="1" recordCount="2580.0"/>
						</Node>
						<Node score="0" recordCount="13120.0">
							<True/>
							<ScoreDistribution value="0" recordCount="13120.0"/>
							<ScoreDistribution value="1" recordCount="0.0"/>
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
						<Node score="1" recordCount="2865.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="41.5"/>
							<ScoreDistribution value="0" recordCount="246.0"/>
							<ScoreDistribution value="1" recordCount="2619.0"/>
						</Node>
						<Node score="0" recordCount="13164.0">
							<True/>
							<ScoreDistribution value="0" recordCount="13164.0"/>
							<ScoreDistribution value="1" recordCount="0.0"/>
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
							<SimplePredicate field="pressure" operator="lessOrEqual" value="956.5"/>
							<Node score="1" recordCount="378.0">
								<SimplePredicate field="temperature" operator="lessOrEqual" value="39.5"/>
								<ScoreDistribution value="0" recordCount="0.0"/>
								<ScoreDistribution value="1" recordCount="378.0"/>
							</Node>
							<Node score="0" recordCount="2614.0">
								<True/>
								<ScoreDistribution value="0" recordCount="2581.0"/>
								<ScoreDistribution value="1" recordCount="33.0"/>
							</Node>
						</Node>
						<Node score="1" recordCount="2380.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="41.5"/>
							<ScoreDistribution value="0" recordCount="181.0"/>
							<ScoreDistribution value="1" recordCount="2199.0"/>
						</Node>
						<Node score="0" recordCount="10675.0">
							<True/>
							<ScoreDistribution value="0" recordCount="10675.0"/>
							<ScoreDistribution value="1" recordCount="0.0"/>
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
						<Node score="1" recordCount="2775.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="41.5"/>
							<ScoreDistribution value="0" recordCount="212.0"/>
							<ScoreDistribution value="1" recordCount="2563.0"/>
						</Node>
						<Node score="0" recordCount="13191.0">
							<True/>
							<ScoreDistribution value="0" recordCount="13191.0"/>
							<ScoreDistribution value="1" recordCount="0.0"/>
						</Node>
					</Node>
				</TreeModel>
			</Segment>
			<Segment id="7">
				<True/>
				<TreeModel functionName="classification" missingValueStrategy="nullPrediction" splitCharacteristic="multiSplit">
					<MiningSchema>
						<MiningField name="temperature"/>
						<MiningField name="wind"/>
					</MiningSchema>
					<Node>
						<True/>
						<Node>
							<SimplePredicate field="temperature" operator="lessOrEqual" value="41.5"/>
							<Node score="1" recordCount="2336.0">
								<SimplePredicate field="temperature" operator="lessOrEqual" value="39.5"/>
								<ScoreDistribution value="0" recordCount="0.0"/>
								<ScoreDistribution value="1" recordCount="2336.0"/>
							</Node>
							<Node score="1" recordCount="98.0">
								<SimplePredicate field="wind" operator="lessOrEqual" value="14.5"/>
								<ScoreDistribution value="0" recordCount="37.0"/>
								<ScoreDistribution value="1" recordCount="61.0"/>
							</Node>
							<Node score="0" recordCount="378.0">
								<True/>
								<ScoreDistribution value="0" recordCount="198.0"/>
								<ScoreDistribution value="1" recordCount="180.0"/>
							</Node>
						</Node>
						<Node score="0" recordCount="13213.0">
							<True/>
							<ScoreDistribution value="0" recordCount="13213.0"/>
							<ScoreDistribution value="1" recordCount="0.0"/>
						</Node>
					</Node>
				</TreeModel>
			</Segment>
			<Segment id="8">
				<True/>
				<TreeModel functionName="classification" missingValueStrategy="nullPrediction" splitCharacteristic="multiSplit">
					<MiningSchema>
						<MiningField name="temperature"/>
						<MiningField name="wind"/>
					</MiningSchema>
					<Node>
						<True/>
						<Node>
							<SimplePredicate field="temperature" operator="lessOrEqual" value="41.5"/>
							<Node score="1" recordCount="2249.0">
								<SimplePredicate field="temperature" operator="lessOrEqual" value="39.5"/>
								<ScoreDistribution value="0" recordCount="0.0"/>
								<ScoreDistribution value="1" recordCount="2249.0"/>
							</Node>
							<Node score="1" recordCount="86.0">
								<SimplePredicate field="wind" operator="lessOrEqual" value="12.5"/>
								<ScoreDistribution value="0" recordCount="36.0"/>
								<ScoreDistribution value="1" recordCount="50.0"/>
							</Node>
							<Node score="0" recordCount="393.0">
								<True/>
								<ScoreDistribution value="0" recordCount="205.0"/>
								<ScoreDistribution value="1" recordCount="188.0"/>
							</Node>
						</Node>
						<Node score="0" recordCount="13124.0">
							<True/>
							<ScoreDistribution value="0" recordCount="13124.0"/>
							<ScoreDistribution value="1" recordCount="0.0"/>
						</Node>
					</Node>
				</TreeModel>
			</Segment>
			<Segment id="9">
				<True/>
				<TreeModel functionName="classification" missingValueStrategy="nullPrediction" splitCharacteristic="multiSplit">
					<MiningSchema>
						<MiningField name="temperature"/>
						<MiningField name="wind"/>
					</MiningSchema>
					<Node>
						<True/>
						<Node>
							<SimplePredicate field="temperature" operator="lessOrEqual" value="41.5"/>
							<Node score="1" recordCount="2384.0">
								<SimplePredicate field="temperature" operator="lessOrEqual" value="39.5"/>
								<ScoreDistribution value="0" recordCount="0.0"/>
								<ScoreDistribution value="1" recordCount="2384.0"/>
							</Node>
							<Node score="0" recordCount="339.0">
								<SimplePredicate field="wind" operator="lessOrEqual" value="52.5"/>
								<ScoreDistribution value="0" recordCount="177.0"/>
								<ScoreDistribution value="1" recordCount="162.0"/>
							</Node>
							<Node score="1" recordCount="98.0">
								<True/>
								<ScoreDistribution value="0" recordCount="34.0"/>
								<ScoreDistribution value="1" recordCount="64.0"/>
							</Node>
						</Node>
						<Node score="0" recordCount="13107.0">
							<True/>
							<ScoreDistribution value="0" recordCount="13107.0"/>
							<ScoreDistribution value="1" recordCount="0.0"/>
						</Node>
					</Node>
				</TreeModel>
			</Segment>
			<Segment id="10">
				<True/>
				<TreeModel functionName="classification" missingValueStrategy="nullPrediction" splitCharacteristic="multiSplit">
					<MiningSchema>
						<MiningField name="temperature"/>
						<MiningField name="wind"/>
					</MiningSchema>
					<Node>
						<True/>
						<Node score="1" recordCount="2391.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="39.5"/>
							<ScoreDistribution value="0" recordCount="0.0"/>
							<ScoreDistribution value="1" recordCount="2391.0"/>
						</Node>
						<Node>
							<SimplePredicate field="temperature" operator="lessOrEqual" value="41.5"/>
							<Node score="0" recordCount="278.0">
								<SimplePredicate field="wind" operator="lessOrEqual" value="41.5"/>
								<ScoreDistribution value="0" recordCount="157.0"/>
								<ScoreDistribution value="1" recordCount="121.0"/>
							</Node>
							<Node score="1" recordCount="170.0">
								<True/>
								<ScoreDistribution value="0" recordCount="75.0"/>
								<ScoreDistribution value="1" recordCount="95.0"/>
							</Node>
						</Node>
						<Node score="0" recordCount="13264.0">
							<True/>
							<ScoreDistribution value="0" recordCount="13264.0"/>
							<ScoreDistribution value="1" recordCount="0.0"/>
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
						<Node score="1" recordCount="2856.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="41.5"/>
							<ScoreDistribution value="0" recordCount="239.0"/>
							<ScoreDistribution value="1" recordCount="2617.0"/>
						</Node>
						<Node score="0" recordCount="13130.0">
							<True/>
							<ScoreDistribution value="0" recordCount="13130.0"/>
							<ScoreDistribution value="1" recordCount="0.0"/>
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
						<Node score="1" recordCount="2326.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="39.5"/>
							<ScoreDistribution value="0" recordCount="0.0"/>
							<ScoreDistribution value="1" recordCount="2326.0"/>
						</Node>
						<Node score="0" recordCount="13544.0">
							<True/>
							<ScoreDistribution value="0" recordCount="13333.0"/>
							<ScoreDistribution value="1" recordCount="211.0"/>
						</Node>
					</Node>
				</TreeModel>
			</Segment>
			<Segment id="13">
				<True/>
				<TreeModel functionName="classification" missingValueStrategy="nullPrediction" splitCharacteristic="multiSplit">
					<MiningSchema>
						<MiningField name="temperature"/>
						<MiningField name="pressure"/>
					</MiningSchema>
					<Node>
						<True/>
						<Node>
							<SimplePredicate field="temperature" operator="lessOrEqual" value="41.5"/>
							<Node score="1" recordCount="2752.0">
								<SimplePredicate field="pressure" operator="lessOrEqual" value="1191.5"/>
								<ScoreDistribution value="0" recordCount="220.0"/>
								<ScoreDistribution value="1" recordCount="2532.0"/>
							</Node>
							<Node score="1" recordCount="51.0">
								<SimplePredicate field="temperature" operator="lessOrEqual" value="39.5"/>
								<ScoreDistribution value="0" recordCount="0.0"/>
								<ScoreDistribution value="1" recordCount="51.0"/>
							</Node>
							<Node score="0" recordCount="21.0">
								<True/>
								<ScoreDistribution value="0" recordCount="11.0"/>
								<ScoreDistribution value="1" recordCount="10.0"/>
							</Node>
						</Node>
						<Node score="0" recordCount="13034.0">
							<True/>
							<ScoreDistribution value="0" recordCount="13034.0"/>
							<ScoreDistribution value="1" recordCount="0.0"/>
						</Node>
					</Node>
				</TreeModel>
			</Segment>
			<Segment id="14">
				<True/>
				<TreeModel functionName="classification" missingValueStrategy="nullPrediction" splitCharacteristic="multiSplit">
					<MiningSchema>
						<MiningField name="temperature"/>
						<MiningField name="pressure"/>
					</MiningSchema>
					<Node>
						<True/>
						<Node>
							<SimplePredicate field="temperature" operator="lessOrEqual" value="41.5"/>
							<Node>
								<SimplePredicate field="pressure" operator="lessOrEqual" value="956.5"/>
								<Node score="1" recordCount="383.0">
									<SimplePredicate field="temperature" operator="lessOrEqual" value="39.5"/>
									<ScoreDistribution value="0" recordCount="0.0"/>
									<ScoreDistribution value="1" recordCount="383.0"/>
								</Node>
								<Node score="0" recordCount="98.0">
									<True/>
									<ScoreDistribution value="0" recordCount="59.0"/>
									<ScoreDistribution value="1" recordCount="39.0"/>
								</Node>
							</Node>
							<Node score="1" recordCount="2310.0">
								<True/>
								<ScoreDistribution value="0" recordCount="161.0"/>
								<ScoreDistribution value="1" recordCount="2149.0"/>
							</Node>
						</Node>
						<Node score="0" recordCount="12927.0">
							<True/>
							<ScoreDistribution value="0" recordCount="12927.0"/>
							<ScoreDistribution value="1" recordCount="0.0"/>
						</Node>
					</Node>
				</TreeModel>
			</Segment>
			<Segment id="15">
				<True/>
				<TreeModel functionName="classification" missingValueStrategy="nullPrediction" splitCharacteristic="multiSplit">
					<MiningSchema>
						<MiningField name="temperature"/>
						<MiningField name="pressure"/>
					</MiningSchema>
					<Node>
						<True/>
						<Node>
							<SimplePredicate field="temperature" operator="lessOrEqual" value="41.5"/>
							<Node score="1" recordCount="2384.0">
								<SimplePredicate field="temperature" operator="lessOrEqual" value="39.5"/>
								<ScoreDistribution value="0" recordCount="0.0"/>
								<ScoreDistribution value="1" recordCount="2384.0"/>
							</Node>
							<Node score="1" recordCount="18.0">
								<SimplePredicate field="pressure" operator="lessOrEqual" value="917.5"/>
								<ScoreDistribution value="0" recordCount="6.0"/>
								<ScoreDistribution value="1" recordCount="12.0"/>
							</Node>
							<Node score="0" recordCount="466.0">
								<True/>
								<ScoreDistribution value="0" recordCount="237.0"/>
								<ScoreDistribution value="1" recordCount="229.0"/>
							</Node>
						</Node>
						<Node score="0" recordCount="13426.0">
							<True/>
							<ScoreDistribution value="0" recordCount="13426.0"/>
							<ScoreDistribution value="1" recordCount="0.0"/>
						</Node>
					</Node>
				</TreeModel>
			</Segment>
			<Segment id="16">
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
							<SimplePredicate field="temperature" operator="lessOrEqual" value="41.5"/>
							<Node score="1" recordCount="2821.0">
								<SimplePredicate field="pressure" operator="lessOrEqual" value="1191.5"/>
								<ScoreDistribution value="0" recordCount="228.0"/>
								<ScoreDistribution value="1" recordCount="2593.0"/>
							</Node>
							<Node score="0" recordCount="5.0">
								<SimplePredicate field="wind" operator="lessOrEqual" value="1.5"/>
								<ScoreDistribution value="0" recordCount="3.0"/>
								<ScoreDistribution value="1" recordCount="2.0"/>
							</Node>
							<Node score="1" recordCount="67.0">
								<True/>
								<ScoreDistribution value="0" recordCount="11.0"/>
								<ScoreDistribution value="1" recordCount="56.0"/>
							</Node>
						</Node>
						<Node score="0" recordCount="13084.0">
							<True/>
							<ScoreDistribution value="0" recordCount="13084.0"/>
							<ScoreDistribution value="1" recordCount="0.0"/>
						</Node>
					</Node>
				</TreeModel>
			</Segment>
			<Segment id="17">
				<True/>
				<TreeModel functionName="classification" missingValueStrategy="nullPrediction" splitCharacteristic="multiSplit">
					<MiningSchema>
						<MiningField name="temperature"/>
						<MiningField name="pressure"/>
					</MiningSchema>
					<Node>
						<True/>
						<Node>
							<SimplePredicate field="temperature" operator="lessOrEqual" value="41.5"/>
							<Node score="1" recordCount="2351.0">
								<SimplePredicate field="temperature" operator="lessOrEqual" value="39.5"/>
								<ScoreDistribution value="0" recordCount="0.0"/>
								<ScoreDistribution value="1" recordCount="2351.0"/>
							</Node>
							<Node score="1" recordCount="291.0">
								<SimplePredicate field="pressure" operator="lessOrEqual" value="1098.5"/>
								<ScoreDistribution value="0" recordCount="136.0"/>
								<ScoreDistribution value="1" recordCount="155.0"/>
							</Node>
							<Node score="0" recordCount="177.0">
								<True/>
								<ScoreDistribution value="0" recordCount="102.0"/>
								<ScoreDistribution value="1" recordCount="75.0"/>
							</Node>
						</Node>
						<Node score="0" recordCount="13225.0">
							<True/>
							<ScoreDistribution value="0" recordCount="13225.0"/>
							<ScoreDistribution value="1" recordCount="0.0"/>
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
							<SimplePredicate field="pressure" operator="lessOrEqual" value="1050.5"/>
							<Node score="1" recordCount="1145.0">
								<SimplePredicate field="temperature" operator="lessOrEqual" value="39.5"/>
								<ScoreDistribution value="0" recordCount="0.0"/>
								<ScoreDistribution value="1" recordCount="1145.0"/>
							</Node>
							<Node score="0" recordCount="6830.0">
								<True/>
								<ScoreDistribution value="0" recordCount="6733.0"/>
								<ScoreDistribution value="1" recordCount="97.0"/>
							</Node>
						</Node>
						<Node score="1" recordCount="1522.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="41.5"/>
							<ScoreDistribution value="0" recordCount="114.0"/>
							<ScoreDistribution value="1" recordCount="1408.0"/>
						</Node>
						<Node score="0" recordCount="6529.0">
							<True/>
							<ScoreDistribution value="0" recordCount="6529.0"/>
							<ScoreDistribution value="1" recordCount="0.0"/>
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
							<SimplePredicate field="pressure" operator="lessOrEqual" value="984.5"/>
							<Node>
								<SimplePredicate field="pressure" operator="lessOrEqual" value="975.5"/>
								<Node score="1" recordCount="565.0">
									<SimplePredicate field="temperature" operator="lessOrEqual" value="39.5"/>
									<ScoreDistribution value="0" recordCount="0.0"/>
									<ScoreDistribution value="1" recordCount="565.0"/>
								</Node>
								<Node score="0" recordCount="3478.0">
									<True/>
									<ScoreDistribution value="0" recordCount="3433.0"/>
									<ScoreDistribution value="1" recordCount="45.0"/>
								</Node>
							</Node>
							<Node score="0" recordCount="482.0">
								<True/>
								<ScoreDistribution value="0" recordCount="436.0"/>
								<ScoreDistribution value="1" recordCount="46.0"/>
							</Node>
						</Node>
						<Node score="1" recordCount="2110.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="41.5"/>
							<ScoreDistribution value="0" recordCount="168.0"/>
							<ScoreDistribution value="1" recordCount="1942.0"/>
						</Node>
						<Node score="0" recordCount="9611.0">
							<True/>
							<ScoreDistribution value="0" recordCount="9611.0"/>
							<ScoreDistribution value="1" recordCount="0.0"/>
						</Node>
					</Node>
				</TreeModel>
			</Segment>
			<Segment id="20">
				<True/>
				<TreeModel functionName="classification" missingValueStrategy="nullPrediction" splitCharacteristic="multiSplit">
					<MiningSchema>
						<MiningField name="temperature"/>
						<MiningField name="wind"/>
					</MiningSchema>
					<Node>
						<True/>
						<Node>
							<SimplePredicate field="temperature" operator="lessOrEqual" value="41.5"/>
							<Node>
								<SimplePredicate field="wind" operator="lessOrEqual" value="48.5"/>
								<Node score="1" recordCount="1603.0">
									<SimplePredicate field="temperature" operator="lessOrEqual" value="39.5"/>
									<ScoreDistribution value="0" recordCount="0.0"/>
									<ScoreDistribution value="1" recordCount="1603.0"/>
								</Node>
								<Node score="0" recordCount="346.0">
									<True/>
									<ScoreDistribution value="0" recordCount="187.0"/>
									<ScoreDistribution value="1" recordCount="159.0"/>
								</Node>
							</Node>
							<Node score="1" recordCount="891.0">
								<True/>
								<ScoreDistribution value="0" recordCount="53.0"/>
								<ScoreDistribution value="1" recordCount="838.0"/>
							</Node>
						</Node>
						<Node score="0" recordCount="13110.0">
							<True/>
							<ScoreDistribution value="0" recordCount="13110.0"/>
							<ScoreDistribution value="1" recordCount="0.0"/>
						</Node>
					</Node>
				</TreeModel>
			</Segment>
		</Segmentation>
	</MiningModel>
</PMML>
'), '2020-09-02 02:52:31.361');
INSERT INTO cdl_refit.models (project_guid, model_guid, format, model, timestamp) VALUES ('b6ee5bab-08dd-49b0-98b6-45cd0a28b12f', 'd46c6d3d-d3c2-4e6a-8132-9076b54d1745', 'PMML', textAsBlob('<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<PMML xmlns="http://www.dmg.org/PMML-4_3" xmlns:data="http://jpmml.org/jpmml-model/InlineTable" version="4.3">
	<Header>
		<Application name="JPMML-SparkML" version="1.5.1"/>
		<Timestamp>2020-09-02T02:54:46Z</Timestamp>
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
						<Node score="1" recordCount="11040.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="75.5"/>
							<ScoreDistribution value="1" recordCount="11040.0"/>
							<ScoreDistribution value="0" recordCount="0.0"/>
						</Node>
						<Node score="0" recordCount="5175.0">
							<True/>
							<ScoreDistribution value="1" recordCount="0.0"/>
							<ScoreDistribution value="0" recordCount="5175.0"/>
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
						<Node score="1" recordCount="11011.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="75.5"/>
							<ScoreDistribution value="1" recordCount="11011.0"/>
							<ScoreDistribution value="0" recordCount="0.0"/>
						</Node>
						<Node score="0" recordCount="5024.0">
							<True/>
							<ScoreDistribution value="1" recordCount="0.0"/>
							<ScoreDistribution value="0" recordCount="5024.0"/>
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
						<Node score="1" recordCount="10831.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="75.5"/>
							<ScoreDistribution value="1" recordCount="10831.0"/>
							<ScoreDistribution value="0" recordCount="0.0"/>
						</Node>
						<Node score="0" recordCount="5084.0">
							<True/>
							<ScoreDistribution value="1" recordCount="0.0"/>
							<ScoreDistribution value="0" recordCount="5084.0"/>
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
						<Node score="1" recordCount="11058.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="75.5"/>
							<ScoreDistribution value="1" recordCount="11058.0"/>
							<ScoreDistribution value="0" recordCount="0.0"/>
						</Node>
						<Node score="0" recordCount="4971.0">
							<True/>
							<ScoreDistribution value="1" recordCount="0.0"/>
							<ScoreDistribution value="0" recordCount="4971.0"/>
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
							<SimplePredicate field="pressure" operator="lessOrEqual" value="1172.5"/>
							<Node score="1" recordCount="9995.0">
								<SimplePredicate field="temperature" operator="lessOrEqual" value="75.5"/>
								<ScoreDistribution value="1" recordCount="9995.0"/>
								<ScoreDistribution value="0" recordCount="0.0"/>
							</Node>
							<Node score="0" recordCount="4543.0">
								<True/>
								<ScoreDistribution value="1" recordCount="0.0"/>
								<ScoreDistribution value="0" recordCount="4543.0"/>
							</Node>
						</Node>
						<Node score="1" recordCount="1509.0">
							<True/>
							<ScoreDistribution value="1" recordCount="977.0"/>
							<ScoreDistribution value="0" recordCount="532.0"/>
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
						<Node score="1" recordCount="10863.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="75.5"/>
							<ScoreDistribution value="1" recordCount="10863.0"/>
							<ScoreDistribution value="0" recordCount="0.0"/>
						</Node>
						<Node score="0" recordCount="5103.0">
							<True/>
							<ScoreDistribution value="1" recordCount="0.0"/>
							<ScoreDistribution value="0" recordCount="5103.0"/>
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
						<Node score="1" recordCount="10983.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="75.5"/>
							<ScoreDistribution value="1" recordCount="10983.0"/>
							<ScoreDistribution value="0" recordCount="0.0"/>
						</Node>
						<Node score="0" recordCount="5042.0">
							<True/>
							<ScoreDistribution value="1" recordCount="0.0"/>
							<ScoreDistribution value="0" recordCount="5042.0"/>
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
						<Node score="1" recordCount="10856.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="75.5"/>
							<ScoreDistribution value="1" recordCount="10856.0"/>
							<ScoreDistribution value="0" recordCount="0.0"/>
						</Node>
						<Node score="0" recordCount="4996.0">
							<True/>
							<ScoreDistribution value="1" recordCount="0.0"/>
							<ScoreDistribution value="0" recordCount="4996.0"/>
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
						<Node score="1" recordCount="10802.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="75.5"/>
							<ScoreDistribution value="1" recordCount="10802.0"/>
							<ScoreDistribution value="0" recordCount="0.0"/>
						</Node>
						<Node score="0" recordCount="5126.0">
							<True/>
							<ScoreDistribution value="1" recordCount="0.0"/>
							<ScoreDistribution value="0" recordCount="5126.0"/>
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
						<Node score="1" recordCount="10969.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="75.5"/>
							<ScoreDistribution value="1" recordCount="10969.0"/>
							<ScoreDistribution value="0" recordCount="0.0"/>
						</Node>
						<Node score="0" recordCount="5134.0">
							<True/>
							<ScoreDistribution value="1" recordCount="0.0"/>
							<ScoreDistribution value="0" recordCount="5134.0"/>
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
						<Node score="1" recordCount="11010.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="75.5"/>
							<ScoreDistribution value="1" recordCount="11010.0"/>
							<ScoreDistribution value="0" recordCount="0.0"/>
						</Node>
						<Node score="0" recordCount="4976.0">
							<True/>
							<ScoreDistribution value="1" recordCount="0.0"/>
							<ScoreDistribution value="0" recordCount="4976.0"/>
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
						<Node score="1" recordCount="10825.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="75.5"/>
							<ScoreDistribution value="1" recordCount="10825.0"/>
							<ScoreDistribution value="0" recordCount="0.0"/>
						</Node>
						<Node score="0" recordCount="5045.0">
							<True/>
							<ScoreDistribution value="1" recordCount="0.0"/>
							<ScoreDistribution value="0" recordCount="5045.0"/>
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
						<Node score="1" recordCount="10843.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="75.5"/>
							<ScoreDistribution value="1" recordCount="10843.0"/>
							<ScoreDistribution value="0" recordCount="0.0"/>
						</Node>
						<Node score="0" recordCount="5015.0">
							<True/>
							<ScoreDistribution value="1" recordCount="0.0"/>
							<ScoreDistribution value="0" recordCount="5015.0"/>
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
						<Node score="1" recordCount="10763.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="75.5"/>
							<ScoreDistribution value="1" recordCount="10763.0"/>
							<ScoreDistribution value="0" recordCount="0.0"/>
						</Node>
						<Node score="0" recordCount="4955.0">
							<True/>
							<ScoreDistribution value="1" recordCount="0.0"/>
							<ScoreDistribution value="0" recordCount="4955.0"/>
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
						<Node score="1" recordCount="11057.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="75.5"/>
							<ScoreDistribution value="1" recordCount="11057.0"/>
							<ScoreDistribution value="0" recordCount="0.0"/>
						</Node>
						<Node score="0" recordCount="5237.0">
							<True/>
							<ScoreDistribution value="1" recordCount="0.0"/>
							<ScoreDistribution value="0" recordCount="5237.0"/>
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
						<Node score="1" recordCount="10973.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="75.5"/>
							<ScoreDistribution value="1" recordCount="10973.0"/>
							<ScoreDistribution value="0" recordCount="0.0"/>
						</Node>
						<Node score="0" recordCount="5004.0">
							<True/>
							<ScoreDistribution value="1" recordCount="0.0"/>
							<ScoreDistribution value="0" recordCount="5004.0"/>
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
						<Node score="1" recordCount="10916.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="75.5"/>
							<ScoreDistribution value="1" recordCount="10916.0"/>
							<ScoreDistribution value="0" recordCount="0.0"/>
						</Node>
						<Node score="0" recordCount="5128.0">
							<True/>
							<ScoreDistribution value="1" recordCount="0.0"/>
							<ScoreDistribution value="0" recordCount="5128.0"/>
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
							<SimplePredicate field="wind" operator="lessOrEqual" value="23.5"/>
							<Node score="1" recordCount="3681.0">
								<SimplePredicate field="temperature" operator="lessOrEqual" value="75.5"/>
								<ScoreDistribution value="1" recordCount="3681.0"/>
								<ScoreDistribution value="0" recordCount="0.0"/>
							</Node>
							<Node score="0" recordCount="1898.0">
								<True/>
								<ScoreDistribution value="1" recordCount="0.0"/>
								<ScoreDistribution value="0" recordCount="1898.0"/>
							</Node>
						</Node>
						<Node score="1" recordCount="7218.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="75.5"/>
							<ScoreDistribution value="1" recordCount="7218.0"/>
							<ScoreDistribution value="0" recordCount="0.0"/>
						</Node>
						<Node score="0" recordCount="3229.0">
							<True/>
							<ScoreDistribution value="1" recordCount="0.0"/>
							<ScoreDistribution value="0" recordCount="3229.0"/>
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
							<SimplePredicate field="pressure" operator="lessOrEqual" value="1172.5"/>
							<Node>
								<SimplePredicate field="pressure" operator="lessOrEqual" value="908.5"/>
								<Node score="1" recordCount="324.0">
									<SimplePredicate field="temperature" operator="lessOrEqual" value="75.5"/>
									<ScoreDistribution value="1" recordCount="324.0"/>
									<ScoreDistribution value="0" recordCount="0.0"/>
								</Node>
								<Node score="0" recordCount="192.0">
									<True/>
									<ScoreDistribution value="1" recordCount="0.0"/>
									<ScoreDistribution value="0" recordCount="192.0"/>
								</Node>
							</Node>
							<Node score="1" recordCount="9785.0">
								<SimplePredicate field="temperature" operator="lessOrEqual" value="75.5"/>
								<ScoreDistribution value="1" recordCount="9785.0"/>
								<ScoreDistribution value="0" recordCount="0.0"/>
							</Node>
							<Node score="0" recordCount="4385.0">
								<True/>
								<ScoreDistribution value="1" recordCount="0.0"/>
								<ScoreDistribution value="0" recordCount="4385.0"/>
							</Node>
						</Node>
						<Node score="1" recordCount="997.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="75.5"/>
							<ScoreDistribution value="1" recordCount="997.0"/>
							<ScoreDistribution value="0" recordCount="0.0"/>
						</Node>
						<Node score="0" recordCount="563.0">
							<True/>
							<ScoreDistribution value="1" recordCount="0.0"/>
							<ScoreDistribution value="0" recordCount="563.0"/>
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
						<Node score="1" recordCount="10854.0">
							<SimplePredicate field="temperature" operator="lessOrEqual" value="75.5"/>
							<ScoreDistribution value="1" recordCount="10854.0"/>
							<ScoreDistribution value="0" recordCount="0.0"/>
						</Node>
						<Node score="0" recordCount="5096.0">
							<True/>
							<ScoreDistribution value="1" recordCount="0.0"/>
							<ScoreDistribution value="0" recordCount="5096.0"/>
						</Node>
					</Node>
				</TreeModel>
			</Segment>
		</Segmentation>
	</MiningModel>
</PMML>
'), '2020-09-02 02:54:45.985');
INSERT INTO cdl_refit.models (project_guid, model_guid, format, model, timestamp) VALUES ('b6ee5bab-08dd-49b0-98b6-45cd0a28b12f', 'd5fc07b4-34a9-4b4e-9930-4134a3d51a8f', 'PMML', textAsBlob('<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<PMML xmlns="http://www.dmg.org/PMML-4_3" xmlns:data="http://jpmml.org/jpmml-model/InlineTable" version="4.3">
	<Header>
		<Application name="JPMML-SparkML" version="1.5.1"/>
		<Timestamp>2020-09-02T03:07:13Z</Timestamp>
	</Header>
	<DataDictionary>
		<DataField name="operable" optype="categorical" dataType="integer">
			<Value value="0"/>
		</DataField>
	</DataDictionary>
	<MiningModel functionName="classification">
		<MiningSchema>
			<MiningField name="operable" usageType="target"/>
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
					</InlineTable>
				</MapValues>
			</OutputField>
			<OutputField name="probability(0)" optype="continuous" dataType="double" feature="probability" value="0"/>
		</Output>
		<Segmentation multipleModelMethod="average">
			<Segment id="1">
				<True/>
				<TreeModel functionName="classification" missingValueStrategy="nullPrediction" splitCharacteristic="multiSplit">
					<MiningSchema/>
					<Node score="0" recordCount="16215.0">
						<True/>
						<ScoreDistribution value="0" recordCount="16215.0"/>
					</Node>
				</TreeModel>
			</Segment>
			<Segment id="2">
				<True/>
				<TreeModel functionName="classification" missingValueStrategy="nullPrediction" splitCharacteristic="multiSplit">
					<MiningSchema/>
					<Node score="0" recordCount="16035.0">
						<True/>
						<ScoreDistribution value="0" recordCount="16035.0"/>
					</Node>
				</TreeModel>
			</Segment>
			<Segment id="3">
				<True/>
				<TreeModel functionName="classification" missingValueStrategy="nullPrediction" splitCharacteristic="multiSplit">
					<MiningSchema/>
					<Node score="0" recordCount="15915.0">
						<True/>
						<ScoreDistribution value="0" recordCount="15915.0"/>
					</Node>
				</TreeModel>
			</Segment>
			<Segment id="4">
				<True/>
				<TreeModel functionName="classification" missingValueStrategy="nullPrediction" splitCharacteristic="multiSplit">
					<MiningSchema/>
					<Node score="0" recordCount="16029.0">
						<True/>
						<ScoreDistribution value="0" recordCount="16029.0"/>
					</Node>
				</TreeModel>
			</Segment>
			<Segment id="5">
				<True/>
				<TreeModel functionName="classification" missingValueStrategy="nullPrediction" splitCharacteristic="multiSplit">
					<MiningSchema/>
					<Node score="0" recordCount="16047.0">
						<True/>
						<ScoreDistribution value="0" recordCount="16047.0"/>
					</Node>
				</TreeModel>
			</Segment>
			<Segment id="6">
				<True/>
				<TreeModel functionName="classification" missingValueStrategy="nullPrediction" splitCharacteristic="multiSplit">
					<MiningSchema/>
					<Node score="0" recordCount="15966.0">
						<True/>
						<ScoreDistribution value="0" recordCount="15966.0"/>
					</Node>
				</TreeModel>
			</Segment>
			<Segment id="7">
				<True/>
				<TreeModel functionName="classification" missingValueStrategy="nullPrediction" splitCharacteristic="multiSplit">
					<MiningSchema/>
					<Node score="0" recordCount="16025.0">
						<True/>
						<ScoreDistribution value="0" recordCount="16025.0"/>
					</Node>
				</TreeModel>
			</Segment>
			<Segment id="8">
				<True/>
				<TreeModel functionName="classification" missingValueStrategy="nullPrediction" splitCharacteristic="multiSplit">
					<MiningSchema/>
					<Node score="0" recordCount="15852.0">
						<True/>
						<ScoreDistribution value="0" recordCount="15852.0"/>
					</Node>
				</TreeModel>
			</Segment>
			<Segment id="9">
				<True/>
				<TreeModel functionName="classification" missingValueStrategy="nullPrediction" splitCharacteristic="multiSplit">
					<MiningSchema/>
					<Node score="0" recordCount="15928.0">
						<True/>
						<ScoreDistribution value="0" recordCount="15928.0"/>
					</Node>
				</TreeModel>
			</Segment>
			<Segment id="10">
				<True/>
				<TreeModel functionName="classification" missingValueStrategy="nullPrediction" splitCharacteristic="multiSplit">
					<MiningSchema/>
					<Node score="0" recordCount="16103.0">
						<True/>
						<ScoreDistribution value="0" recordCount="16103.0"/>
					</Node>
				</TreeModel>
			</Segment>
			<Segment id="11">
				<True/>
				<TreeModel functionName="classification" missingValueStrategy="nullPrediction" splitCharacteristic="multiSplit">
					<MiningSchema/>
					<Node score="0" recordCount="15986.0">
						<True/>
						<ScoreDistribution value="0" recordCount="15986.0"/>
					</Node>
				</TreeModel>
			</Segment>
			<Segment id="12">
				<True/>
				<TreeModel functionName="classification" missingValueStrategy="nullPrediction" splitCharacteristic="multiSplit">
					<MiningSchema/>
					<Node score="0" recordCount="15870.0">
						<True/>
						<ScoreDistribution value="0" recordCount="15870.0"/>
					</Node>
				</TreeModel>
			</Segment>
			<Segment id="13">
				<True/>
				<TreeModel functionName="classification" missingValueStrategy="nullPrediction" splitCharacteristic="multiSplit">
					<MiningSchema/>
					<Node score="0" recordCount="15858.0">
						<True/>
						<ScoreDistribution value="0" recordCount="15858.0"/>
					</Node>
				</TreeModel>
			</Segment>
			<Segment id="14">
				<True/>
				<TreeModel functionName="classification" missingValueStrategy="nullPrediction" splitCharacteristic="multiSplit">
					<MiningSchema/>
					<Node score="0" recordCount="15718.0">
						<True/>
						<ScoreDistribution value="0" recordCount="15718.0"/>
					</Node>
				</TreeModel>
			</Segment>
			<Segment id="15">
				<True/>
				<TreeModel functionName="classification" missingValueStrategy="nullPrediction" splitCharacteristic="multiSplit">
					<MiningSchema/>
					<Node score="0" recordCount="16294.0">
						<True/>
						<ScoreDistribution value="0" recordCount="16294.0"/>
					</Node>
				</TreeModel>
			</Segment>
			<Segment id="16">
				<True/>
				<TreeModel functionName="classification" missingValueStrategy="nullPrediction" splitCharacteristic="multiSplit">
					<MiningSchema/>
					<Node score="0" recordCount="15977.0">
						<True/>
						<ScoreDistribution value="0" recordCount="15977.0"/>
					</Node>
				</TreeModel>
			</Segment>
			<Segment id="17">
				<True/>
				<TreeModel functionName="classification" missingValueStrategy="nullPrediction" splitCharacteristic="multiSplit">
					<MiningSchema/>
					<Node score="0" recordCount="16044.0">
						<True/>
						<ScoreDistribution value="0" recordCount="16044.0"/>
					</Node>
				</TreeModel>
			</Segment>
			<Segment id="18">
				<True/>
				<TreeModel functionName="classification" missingValueStrategy="nullPrediction" splitCharacteristic="multiSplit">
					<MiningSchema/>
					<Node score="0" recordCount="16026.0">
						<True/>
						<ScoreDistribution value="0" recordCount="16026.0"/>
					</Node>
				</TreeModel>
			</Segment>
			<Segment id="19">
				<True/>
				<TreeModel functionName="classification" missingValueStrategy="nullPrediction" splitCharacteristic="multiSplit">
					<MiningSchema/>
					<Node score="0" recordCount="16246.0">
						<True/>
						<ScoreDistribution value="0" recordCount="16246.0"/>
					</Node>
				</TreeModel>
			</Segment>
			<Segment id="20">
				<True/>
				<TreeModel functionName="classification" missingValueStrategy="nullPrediction" splitCharacteristic="multiSplit">
					<MiningSchema/>
					<Node score="0" recordCount="15950.0">
						<True/>
						<ScoreDistribution value="0" recordCount="15950.0"/>
					</Node>
				</TreeModel>
			</Segment>
		</Segmentation>
	</MiningModel>
</PMML>
'), '2020-09-02 03:07:13.060');