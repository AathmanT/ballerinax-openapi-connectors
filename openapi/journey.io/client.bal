// Copyright (c) 2021 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/http;

# Provides API key configurations needed when communicating with a remote HTTP endpoint.
public type ApiKeysConfig record {|
    # Represents API Key `X-Api-Key`
    string xApiKey;
|};

# This is a generated connector for [Journey.io API v1.0.0](https://www.journey.io/) OpenAPI specification.
# The journy.io API is organized around REST. Our API has predictable resource-oriented URLs, returns JSON-encoded responses, and uses standard HTTP response codes, authentication, and verbs.
@display {label: "journey.io", iconPath: "resources/journey.io.svg"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [Journy.io account](https://www.journey.io) and obtain the API Key following [this guide](https://developers.journy.io/#section/Authentication).
    #
    # + apiKeyConfig - API keys for authorization 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://api.journy.io") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
    }
    # Link web activity to user
    #
    # + return - Object was created 
    remote isolated function link(LinkBody payload) returns InlineResponse201|error {
        string  path = string `/link`;
        map<any> headerValues = {"X-Api-Key": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InlineResponse201 response = check self.clientEp->post(path, request, headers = accHeaders, targetType=InlineResponse201);
        return response;
    }
    # Push event
    #
    # + return - Object was created 
    remote isolated function trackJourneyEvent(EventsBody payload) returns InlineResponse201|error {
        string  path = string `/events`;
        map<any> headerValues = {"X-Api-Key": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InlineResponse201 response = check self.clientEp->post(path, request, headers = accHeaders, targetType=InlineResponse201);
        return response;
    }
    # Create or update user
    #
    # + return - Object was created 
    remote isolated function upsertUser(UsersUpsertBody payload) returns InlineResponse201|error {
        string  path = string `/users/upsert`;
        map<any> headerValues = {"X-Api-Key": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InlineResponse201 response = check self.clientEp->post(path, request, headers = accHeaders, targetType=InlineResponse201);
        return response;
    }
    # Create or update account
    #
    # + return - Object was created 
    remote isolated function upsertAccount(AccountsUpsertBody payload) returns InlineResponse201|error {
        string  path = string `/accounts/upsert`;
        map<any> headerValues = {"X-Api-Key": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InlineResponse201 response = check self.clientEp->post(path, request, headers = accHeaders, targetType=InlineResponse201);
        return response;
    }
    # Add user to account
    #
    # + accountId - Unique identifier for the account in your database 
    # + return - Object was created 
    remote isolated function addUserToAccount(string accountId, AccountidUsersBody payload) returns InlineResponse201|error {
        string  path = string `/accounts/${accountId}/users`;
        map<any> headerValues = {"X-Api-Key": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InlineResponse201 response = check self.clientEp->post(path, request, headers = accHeaders, targetType=InlineResponse201);
        return response;
    }
    # Remove user from account
    #
    # + accountId - Unique identifier for the account in your database 
    # + return - Object was created 
    remote isolated function removeUserFromAccount(string accountId, AccountidUsersBody1 payload) returns InlineResponse201|error {
        string  path = string `/accounts/${accountId}/users`;
        map<any> headerValues = {"X-Api-Key": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InlineResponse201 response = check self.clientEp->delete(path, request, headers = accHeaders, targetType=InlineResponse201);
        return response;
    }
    # Validate API key
    #
    # + return - Key validation 
    remote isolated function getValidity() returns InlineResponse200|error {
        string  path = string `/validate`;
        map<any> headerValues = {"X-Api-Key": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse200 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse200);
        return response;
    }
    # Get snippet for a website
    #
    # + domain - The domain you want to receive a snippet for 
    # + return - Snippet 
    remote isolated function getTrackingSnippet(string domain) returns InlineResponse2001|error {
        string  path = string `/tracking/snippet`;
        map<anydata> queryParam = {"domain": domain};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Api-Key": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse2001 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse2001);
        return response;
    }
}
