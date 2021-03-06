{*<!--
/*+***********************************************************************************************************************************
 * The contents of this file are subject to the YetiForce Public License Version 1.1 (the "License"); you may not use this file except
 * in compliance with the License.
 * Software distributed under the License is distributed on an "AS IS" basis, WITHOUT WARRANTY OF ANY KIND, either express or implied.
 * See the License for the specific language governing rights and limitations under the License.
 * The Original Code is YetiForce.
 * The Initial Developer of the Original Code is YetiForce. Portions created by YetiForce are Copyright (C) www.yetiforce.com. 
 * All Rights Reserved.
 *************************************************************************************************************************************/
-->*}
{strip}
	<div class="container-fluid" id="MobileKeysContainer">
		<div class="widget_header row-fluid">
			<div class="span8"><h3>{vtranslate('LBL_MOBILE_KEYS', $QUALIFIED_MODULE)}</h3>{vtranslate('LBL_MOBILE_KEYS_DESCRIPTION', $QUALIFIED_MODULE)}</div>
			<div class="span4"><button class="btn btn-primary addKey pull-right">{vtranslate('LBL_ADD_KEY',$QUALIFIED_MODULE)}</button></div>
		</div>
		<hr>
		<div class="contents">
			<div class="row-fluid">
				<div class="contents tabbable">
					<table class="table table-bordered table-condensed listViewEntriesTable">
						<thead>
							<tr class="blockHeader">
								<th><strong>{vtranslate('LBL_USERNAME',$QUALIFIED_MODULE)}</strong></th>
								<th><strong>{vtranslate('LBL_SERVICE',$QUALIFIED_MODULE)}</strong></th>
								<th><strong>{vtranslate('LBL_KEY',$QUALIFIED_MODULE)}</strong></th>
								<th><strong>{vtranslate('LBL_WHO_CAN_DIAL',$QUALIFIED_MODULE)}</strong></th>
								<th><strong>{vtranslate('LBL_TOOLS',$QUALIFIED_MODULE)}</strong></th>
							</tr>
						</thead>
						<tbody>
							{foreach from=$MODULE_MODEL->getAllMobileKeys() item=item key=key}
								<tr data-service="{$item.service}" data-user="{$item.userid}">
									<td><span title="{$item.first_name} {$item.last_name}">{$item.user_name}</span></td>
									<td>{vtranslate($item.name,$QUALIFIED_MODULE)}</td>
									<td>{$item.key}</td>
									<td>
										{if $item.service == 'pushcall'}
										<select multiple class="chzn-select span5 privileges_users" name="privileges_users" data-validation-engine="validate[required]">
											{assign var=ALLUSERS value=Users_Record_Model::getAll()}
											{foreach from=$ALLUSERS item=item2 key=key2}
												<option value="{$key2}" {if in_array($key2,$item.privileges_users)}selected{/if}>{$item2->getDisplayName()}</option>
											{/foreach}
										</select>
										{/if}
									</td>
									<td>
										<button class="btn btn-danger deleteKey">{vtranslate('LBL_DELETE_KEY',$QUALIFIED_MODULE)}</button>
									</td>
								</tr>
							{/foreach}
						</tbody>
					</table>
				</div>
			</div>
			<div class="clearfix"></div>
			<div class="modal addKeyContainer hide">
				<div class="modal-header contentsBackground">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h3>{vtranslate('LBL_ADD_KEY', $QUALIFIED_MODULE)}</h3>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="control-group">
							<label class="control-label">{vtranslate('LBL_SELECT_USER', $QUALIFIED_MODULE)}</label>
							<div class="controls">
								<select class="select span4 user" name="user" data-validation-engine="validate[required]">
								{foreach from=$USERS item=item key=key}
									<option value="{$key}">{$item->getDisplayName()}</option>
								{/foreach}
								</select>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">{vtranslate('LBL_SELECT_SERVICE', $QUALIFIED_MODULE)}</label>
							<div class="controls">
								<select class="select span4 service" name="service" data-validation-engine="validate[required]">
								{foreach from=$MODULE_MODEL->getAllService() item=item key=key}
									<option value="{$key}">{vtranslate($item,$QUALIFIED_MODULE)}</option>
								{/foreach}
								</select>
							</div>
						</div>
					</form>
				</div>
				{include file='ModalFooter.tpl'|@vtemplate_path:$MODULE}
			</div>
		</div>	
	</div>
{/strip}